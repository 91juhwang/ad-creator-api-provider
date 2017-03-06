module Api
  module V1
    class AdsController < ApplicationController
      def create
        ad = Ad.create!(ad_params)      
        render json: { message: 'Ad created successfully', id: ad.id }
      rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity 
      end

      private
      def ad_params
        params.permit(:title, :price, :description, :user_id)
      end
    end
  end
end