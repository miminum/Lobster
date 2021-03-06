class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_one :shop
  has_many :items, through: :shop
  has_many :orders, through: :shop
  has_many :conversations
  has_many :messages
  has_many :reviews
end
