class CreateUserTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :call_sign, null: false
      t.string :name, null: false
      t.string :grid, null: false
    end
  end
end
