require 'rails_helper'
require 'controller_shared_context'

RSpec.describe Api::V1::OffersController, type: :controller do
  describe 'POST create' do
    include_context 'permit_params'
    let(:offer) { FactoryGirl.build(:offer, id: 1) }
    let(:params) { FactoryGirl.attributes_for(:offer).merge(ad_id: '1', user_id: '3') }
    let(:execute_request) { post :create, params: params }

    context 'when valid parameters are passed' do
      before do
        expect(Offer).to receive(:create!).with(permitted_params).and_return(offer)
        execute_request
      end

      it_responds_with 'a success status'
      it_responds_with 'JSON body', '{"message": "Offer created successfully", "id": 1 }'
    end
  end
end