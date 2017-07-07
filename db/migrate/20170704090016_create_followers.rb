class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
      t.references :user,             null: false, index: true
      t.integer    :followed_user_id, null: false, index: true
      t.timestamps
    end
  end
end
