class CreateCreditcards < ActiveRecord::Migration[5.0]
  def change
    create_table :creditcards do |t|
      t.references  :user
      t.string      :campany
      t.integer     :number
      t.integer     :expire_year
      t.integer     :expire_month
      t.timestamps
    end
  end
end
