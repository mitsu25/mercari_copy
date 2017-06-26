class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string      :name,             null: false
      t.integer     :price,            null: false
      t.text        :descripation,     null: false
      t.references  :brand
      t.references  :category,         null: false
      t.references  :sub_category,     null: false
      t.references  :size
      t.references  :sller,            index: true
      t.references  :buyer,            index: true
      t.integer     :status,           null: false
      t.integer     :delivery_fee,     null: false
      t.integer     :delivery_by,      null: false
      t.integer     :delivery_from,    null: false
      t.integer     :delivery_untill,  null: false
      t.integer     :stock_status
      t.timestamps
    end
  end
end
