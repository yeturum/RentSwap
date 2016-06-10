class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :city
      t.string :address
      t.date :rent_dates
      t.integer :rent_amount
      t.text :details

      t.timestamps

    end
  end
end
