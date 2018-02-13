class CreateChanges < ActiveRecord::Migration[5.1]
  def change
    change_column_null :devices, :name, false
  end
end
