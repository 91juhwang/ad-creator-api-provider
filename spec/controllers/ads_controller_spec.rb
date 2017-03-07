require 'rails_helper'
 
RSpec.describe Api::V1::AdsController, type: :controller do
  describe 'POST create' do
    let(:ad) { FactoryGirl.build(:ad, id: 1) }
    let(:params) { FactoryGirl.attributes_for(:ad).merge(user_id: '1') }
    let(:permitted_params) { ActionController::Parameters.new(params) }
    let(:execute_request) { post :create, params: params }

    before(:all) do 
      ActionController::Parameters.permit_all_parameters = true
    end

    context 'when valid parameters are passed' do
      before do
        expect(Ad).to receive(:create!).with(permitted_params).and_return(ad)
        execute_request
      end

      it 'should return a successful response' do
        expect(response).to have_http_status(:success)
      end

      it 'should return success message with an ad_id' do
        expect(JSON.parse(response.body)).to eq(JSON.parse('{"message": "Ad created successfully", "id": 1 }'))
      end
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