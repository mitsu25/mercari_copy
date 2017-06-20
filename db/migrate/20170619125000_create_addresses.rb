class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user
      t.string     :family_name      , null: false
      t.string     :first_name       , null: false
      t.string     :family_name_kana , null: false
      t.string     :first_name_kana  , null: false
      t.integer    :zip_code         , null: false
      t.string     :prefecture       , null: false
      t.string     :city             , null: false
      t.string     :town             , null: false
      t.string     :house_number     , null: false
      t.string     :building
      t.integer    :telephone
      t.timestamps
    end
  end
end
