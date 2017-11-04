class Profile < ApplicationRecord
  validates_presence_of :first_name, :last_name, :phone_number, :street_address, :suburb, :state
  belongs_to :user 
end
