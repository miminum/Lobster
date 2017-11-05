class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.date :date
      t.time :open
      t.time :close
      t.references :item, foreign_key: true
      t.integer :quantity
      t.references :seller_profile, foreign_key: true

      t.timestamps
    end
  end
end
