class Item < ApplicationRecord

#---------- Assciations------------------
  belongs_to :brand
  belongs_to :category
  belongs_to :subcategory
  belongs_to :seller
  belongs_to :buyer
  has_many   :imagess
end