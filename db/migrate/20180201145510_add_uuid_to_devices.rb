class AddUuidToDevices < ActiveRecord::Migration[5.1]
  def change
    add_column :devices, :segunda_id, :uuid, default: 'uuid_generate_v4()', :null => false
  end
end
