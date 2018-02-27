ActiveRecord::Schema.define(version: 201_802_071_242_48) do
  enable_extension 'plpgsql'
  enable_extension 'uuid-ossp'

  create_table 'devices', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'address', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.uuid 'uuid', default: -> { 'uuid_generate_v4()' }, null: false
  end
end
