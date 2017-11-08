class Review < ApplicationRecord
  validates :score, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }

  belongs_to :user
  belongs_to :shop
  belongs_to :order

  validates_uniqueness_of :user_id, :scope => :order_id

  def user
    User.find(user_id)
  end
end
