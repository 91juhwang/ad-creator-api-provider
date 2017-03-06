class AddUserToAds < ActiveRecord::Migration[5.0]
  def change
    add_reference :ads, :user, foreign_key: true
  end
end
