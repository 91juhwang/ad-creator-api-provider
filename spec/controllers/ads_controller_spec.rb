require 'rails_helper'
require 'controller_shared_context'
 
RSpec.describe Api::V1::AdsController, type: :controller do
  describe 'POST create' do
    include_context 'permit_params'
    let(:ad) { FactoryGirl.build(:ad, id: 1) }
    let(:params) { FactoryGirl.attributes_for(:ad).merge(user_id: '1') }
    let(:execute_request) { post :create, params: params }

    context 'when valid parameters are passed' do
      before do
        expect(Ad).to receive(:create!).with(permitted_params).and_return(ad)
        execute_request
      end
      it_responds_with 'a success status'
      it_responds_with 'JSON body', '{"message": "Ad created successfully", "id": 1 }'
    end

    context 'when invalid parameters are passed' do
      before do
        ad.errors.add(:title, "can't be blank")
        expect(Ad).to receive(:create!).with(permitted_params).and_raise(ActiveRecord::RecordInvalid.new(ad))
        execute_request
      end
      it 'should return model validation errors' do
        expect(JSON.parse(response.body)).to eq(JSON.parse('{ "errors": {"title": ["can\'t be blank"] }}'))
      end

      it 'should return unprocessable entity response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end