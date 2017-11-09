class Shop < ApplicationRecord
  include ShopPhotoUploader[:shop_photo]
  include UserPhotoUploader[:user_photo]
  belongs_to :user
  has_many :item
  validates_presence_of :shop_name, :cuisine_type
  validates :delivery_cost, numericality: { greater_than_or_equal_to: 0, less_than: 20 }
  
  CUISINE_TYPES = ["Continental", "Chinese", "French", "Italian", "Japanese", "Mexican", "Spanish", "Ethiopian", "Thai", "African", "Vietnamese"]
  FILTERS = [nil, "Distance", "Review Score", "Popularity"]

  # Method to see only shops with active items
  def self.active_items
    shop_id = []
    Item.where(active: true).each do |item|
      shop_id << item.shop_id
    end
    self.where(id: shop_id)
  end

  # Method to search term
  def self.search (term)
    items = Item.where('lower(name) Like ? OR lower(description) Like ?', "%#{term.downcase}%", "%#{term.downcase}%").where(active: true)
    shop_id = []
    items.each do |item|
      shop_id << item.shop_id
    end
    self_search = self.active_items.where('lower(shop_name) Like ? OR lower(cuisine_type) Like ?', "%#{term.downcase}%", "%#{term.downcase}%")

    (self.where(id: shop_id) + self_search).uniq
  end

  # Start address methods
  def street_address
    User.find(self.user_id).profile.street_address
  end

  def suburb
    User.find(self.user_id).profile.suburb
  end

  def state
    User.find(self.user_id).profile.state
  end
  # End address methods

  def owner
    User.find(self.user_id)
  end

  def average_score
    average =  Review.where(shop: self).average(:score)
    '%.1f' % average if average
  end

  def reviews
    Review.where(shop: self)
  end

  def longitude
    User.find(user_id).profile.longitude
  end
  
  def latitude
    User.find(user_id).profile.latitude
  end

  def distance_from_user (user)
    Geocoder::Calculations.distance_between([self.longitude,self.latitude], [user.profile.longitude,user.profile.latitude], :units => :km).round(1)
  end
  
  def popularity
    Order.where(shop: self).count + Review.where(shop: self).count
  end

  def self.filter_by(word, user)
    if word == "Distance"
      filtered = self.active_items.sort_by {|shop| shop.distance_from_user(user) }.reverse
    elsif word == "Review Score"
      filtered = self.active_items.sort_by {|shop| shop.average_score.to_i }.reverse
    elsif word == "Popularity"
      filtered = self.active_items.sort_by {|shop| shop.popularity }.reverse
    end
    filtered
  end

  def self.filter_search_by(term, word, user)
    if word == "Distance"
      filtered = self.search(term).sort_by {|shop| shop.distance_from_user(user) }.reverse
    elsif word == "Review Score"
      filtered = self.search(term).sort_by {|shop| shop.average_score.to_i }.reverse
    elsif word == "Popularity"
      filtered = self.search(term).sort_by {|shop| shop.popularity }.reverse
    end
    filtered
  end
end
