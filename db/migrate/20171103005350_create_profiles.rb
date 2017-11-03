class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :street_address
      t.string :suburb
      t.string :state
      t.string :temp_street_address
      t.string :temp_suburb
      t.string :temp_state

      t.timestamps
    end
  end
end
