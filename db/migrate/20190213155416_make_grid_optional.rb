class MakeGridOptional < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :grid, :string, null: true
  end
end
