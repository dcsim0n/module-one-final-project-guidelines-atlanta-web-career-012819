class LatitudeToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :summits, :latitude, :float
  end
end
