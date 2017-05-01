class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :ad
  validates :price, presence: true

  # Displays the bid in the order of highest price.
  default_scope { select('id', 'message', 'price', 'user_id').order(price: :desc) }
end