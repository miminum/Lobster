class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :buyer_id
      t.references :shop, foreign_key: true
      t.boolean :delivery
      t.float :total_price
      t.string :charge_identifier
      t.boolean :payment_success, default: false
      t.boolean :mark_as_done, default: false

      t.timestamps
    end
  end
end
