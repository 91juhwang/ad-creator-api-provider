class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :ad
  validates :price, presence: true

  default_scope { select('id', 'message', 'price', 'user_id').order(price: :desc) }
end