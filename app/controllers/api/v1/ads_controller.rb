module Api
  module V1
    class AdsController < ApplicationController
      def create
        ad = Ad.create(ad_params)      
        render json: { Message: 'Ad created successfully', id: ad.id}
      end

      private
      def ad_params
        params.permit(:title, :price, :description, :user_id)
      end
    end
  end
end