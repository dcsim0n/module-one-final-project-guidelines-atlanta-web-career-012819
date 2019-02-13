class SummitPointsToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :summits, :points, :integer
  end
end
