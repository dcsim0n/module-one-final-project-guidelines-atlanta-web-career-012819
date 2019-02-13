class AddActivatorColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :activator, :boolean, :default => false
  end
end
