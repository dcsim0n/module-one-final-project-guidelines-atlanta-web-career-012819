class CreateContactsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :summit_id
      t.integer :activator_id
      t.integer :chaser_id
      t.decimal :freq #to float
      t.string :band
      t.datetime :date
    end
  end
end
