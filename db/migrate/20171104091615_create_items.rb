class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :seller_profile, foreign_key: true
      t.string :name
      t.text :description
      t.text :image_data
      t.text :allergies
      t.boolean :vegetarian
      t.float :price

      t.timestamps
    end
  end
end
