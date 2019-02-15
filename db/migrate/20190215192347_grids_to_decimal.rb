class GridsToDecimal < ActiveRecord::Migration[5.2]
  def change
    change_column :summits, :longitude, :float
    change_column :summits, :longitude, :float
  end
end
