class Ad < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  default_scope { select('id', 'title', 'description', 'price') }
end