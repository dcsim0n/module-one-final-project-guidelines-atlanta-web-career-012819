class CreateSummitsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :summits
    create_table :summits do |t|
      t.string :summit_code
      t.string :association_name
      t.string :region_name
      t.string :summit_name
      t.integer :alt_m
      t.integer :alt_ft
      t.string :grid_ref1
      t.string :grid_ref2
      t.string :longitude
      t.string :latitude
      t.integer :points
      t.integer :bonus_points
      t.string :valid_from
      t.string :valid_to
      t.integer :activation_count
      t.string :activation_date
      t.string :activation_call
    end
  end
end
