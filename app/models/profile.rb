class Profile < ApplicationRecord
  validates_presence_of :first_name, :last_name, :phone_number, :street_address, :suburb, :state
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "numbers only" }
  belongs_to :user
  
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  validates_uniqueness_of :user_id
  STATES = ["VIC", "NSW", "SA", "WA", "ACT", "QLD", "NT", "TAS"]

  def full_street_address
    "#{street_address}, #{suburb}, #{state}, AU"
  end

  def distance_between (user)
    Geocoder::Calculations.distance_between([self.longitude,self.latitude], [user.profile.longitude,user.profile.latitude], :units => :km).round(1)
  end

  def email
    User.find(user_id).email
  end
end
