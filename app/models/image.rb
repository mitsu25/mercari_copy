class Image < ApplicationRecord

#---------- Assciations------------------
  belongs_to :item, required: false

#----------画像アップロード用--------------
  mount_uploader :image, ImageUploader

end
