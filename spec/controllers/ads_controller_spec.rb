require 'rails_helper'
 
RSpec.describe Api::V1::AdsController, type: :controller do
  describe 'POST create' do
    let(:params) { FactoryGirl.attributes_for(:ad).merge(user_id: '1') }
    let(:execute_request) { post :create, params: params }

    context 'when parameters are valid' do 
      before do 
        ActionController::Parameters.permit_all_parameters = true
        permitted_parameters = ActionController::Parameters.new(params)
        expect(Ad).to receive(:create).with(permitted_parameters).and_return(FactoryGirl.build(:ad, id: 1))
        execute_request
      end
      it 'should return a successful response' do 
        expect(response).to have_http_status(:success)
      end

      it 'should return success message with an ad_id' do
        expect(JSON.parse(response.body)).to eq(JSON.parse('{"message": "Ad created successfully", "id": 1 }'))
      end
    end
  end
end