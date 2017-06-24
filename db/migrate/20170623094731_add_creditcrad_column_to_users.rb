class AddCreditcradColumnToUsers < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :campany,      :string
      add_column :users, :number,       :integer, unique: true
      add_column :users, :expire_year,  :integer
      add_column :users, :expire_month, :integer
  end
end
