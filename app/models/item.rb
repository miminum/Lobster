class Item < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :shop
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
