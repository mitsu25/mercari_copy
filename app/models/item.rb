class Item < ApplicationRecord

#---------- Assciations------------------
  # belongs_to :brand
  # belongs_to :category
  # belongs_to :subcategory
  # belongs_to :buyer
  belongs_to   :user
  has_many     :images
end
