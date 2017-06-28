class Category < ApplicationRecord
  belongs_to :root_category
  has_many   :sub_categories
end
