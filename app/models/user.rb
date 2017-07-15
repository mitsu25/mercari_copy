class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#---------- Associations -----------------
  has_many :items
  has_many :buyers
  has_many :followers
  has_many :likes
end
