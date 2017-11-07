class AddLatitudeAndLongitudeToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :latitude, :decimal, precision: 10, scale:6
    add_column :profiles, :longitude, :decimal, precision: 10, scale:6
  end
end
