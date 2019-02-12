class CreateUserSettingsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :user_settings do |t|
      t.integer :user_id
      t.string :setting_name
      t.integer :setting_value
      # !!FIX ME!! change these to be not null #
    end
  end
end
