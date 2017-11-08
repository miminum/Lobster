class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.references :order, foreign_key: true
      t.text :content
      t.integer :score

      t.timestamps
    end
  end
end
