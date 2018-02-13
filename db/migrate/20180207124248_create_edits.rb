class CreateEdits < ActiveRecord::Migration[5.1]
  def change
    change_column_null :devices, :address, false
    change_table(:devices) do |t|
      t.rename :segunda_id, :uuid
    end
  end
end
