class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :name, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end
