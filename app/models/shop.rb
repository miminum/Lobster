class Shop < ApplicationRecord
  include ShopPhotoUploader[:shop_photo]
  include UserPhotoUploader[:user_photo]
  belongs_to :user
  has_many :item
  validates_presence_of :shop_name, :cuisine_type
  validates :delivery_cost, numericality: { greater_than_or_equal_to: 0, less_than: 20 }
  
  CUISINE_TYPES = ["Continental", "Chinese", "French", "Italian", "Japanese", "Mexican", "Spanish", "Ethiopian", "Thai", "African", "Vietnamese"]

  def self.active_items
    shop_id = []
    Item.where(active: true).each do |item|
      shop_id << item.shop_id
    end
    self.where(id: shop_id)
  end

  def self.search (term)
    items = Item.where('lower(name) Like ? OR lower(description) Like ?', "%#{term.downcase}%", "%#{term.downcase}%").where(active: true)
    shop_id = []
    items.each do |item|
      shop_id << item.shop_id
    end
    self_search = self.active_items.where('lower(shop_name) Like ? OR lower(cuisine_type) Like ?', "%#{term.downcase}%", "%#{term.downcase}%")

    (self.where(id: shop_id) + self_search).uniq
  end

  def street_address
    User.find(self.user_id).profile.street_address
  end

  def suburb
    User.find(self.user_id).profile.suburb
  end

  def state
    User.find(self.user_id).profile.state
  end

  def owner
    User.find(self.user_id)
  end
end
