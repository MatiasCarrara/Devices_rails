class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.text :email, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
  end
