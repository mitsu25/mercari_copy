class CreateBuyers < ActiveRecord::Migration[5.0]
  def change
    create_table :buyers do |t|
      t.references :user, null:false, index: true
      t.references :item, null:false, index: true
      t.timestamps
    end
  end
end
