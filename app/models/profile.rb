class Profile < ApplicationRecord
  validates_presence_of :first_name, :last_name, :phone_number, :street_address, :suburb, :state
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "numbers only" }
  belongs_to :user 
end
