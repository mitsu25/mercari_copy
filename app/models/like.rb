class Like < ApplicationRecord
  # --------  Association  --------------
  belongs_to  :user
  belongs_to  :item
end
