class FrequencyToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :contacts, :freq, :float
  end
end
