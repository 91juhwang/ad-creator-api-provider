class AdsController < ApplicationController
  include ResourceController

  private

  def permitted_params
    params.permit(:title, :price, :description, :user_id)
  end
end