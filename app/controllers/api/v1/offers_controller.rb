module Api
  module V1
    class OffersController < ApplicationController
      def create
        offer = Offer.create!(offer_params)
        render json: { message: 'Offer created successfully', id: offer.id }
      end
      
      private
      def offer_params
        params.permit(:message, :price, :ad_id, :user_id)
      end
    end
  end
end