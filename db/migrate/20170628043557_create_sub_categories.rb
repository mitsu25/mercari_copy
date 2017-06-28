class CreateSubCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_categories do |t|
      t.string     :name
      t.references :category
      t.timestamps
    end
  end
end
