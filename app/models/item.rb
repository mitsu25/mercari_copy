class Item < ApplicationRecord

#---------- Assciations -----------------
  # belongs_to :brand
  # belongs_to :category
  # belongs_to :buyer
  belongs_to   :sub_category
  belongs_to   :user
  has_many     :images

#---------- enum -------------------------

  enum status: { "新品、未使用品": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4,"傷や汚れあり": 5, "全体的に状態が悪い": 6}
  enum delivery_fee: { "送料込み（出品者負担）": 1, "着払い": 2 }
  enum delivery_by: { "未定": 1, "らくらくコピカリ便": 2, "ゆうメール": 3, "レターパック": 4,"普通郵便（定型、定形外）": 5, "クロネコヤマト":  6, "ゆうパック": 7, "はこBOON": 7, "ポスパケット・ゆうパケット":  7}
  enum delivery_untill: { "1〜2日で発送": 1, "2〜3日で発送": 2, "4〜7日で発送": 3}

end
