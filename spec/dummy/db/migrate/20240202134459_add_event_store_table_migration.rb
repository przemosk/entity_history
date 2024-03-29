class AddEventStoreTableMigration < ActiveRecord::Migration[7.0]
  def change
    create_table(:event_store_events_in_streams, id: :bigserial, force: false) do |t|
      t.string      :stream,      null: false
      t.integer     :position,    null: true
      t.references  :event,       null: false, type: :uuid, index: false
      t.datetime    :created_at,  null: false, type: :timestamp, precision: 6, index: true
    end
    add_index :event_store_events_in_streams, %i[stream position], unique: true
    add_index :event_store_events_in_streams, %i[stream event_id], unique: true
    add_index :event_store_events_in_streams, [:event_id]

    create_table(:event_store_events, id: :bigserial, force: false) do |t|
      t.references  :event,       null: false, type: :uuid, index: { unique: true }
      t.string      :event_type,  null: false, index: true
      t.jsonb      :metadata
      t.jsonb      :data, null: false
      t.datetime    :created_at,  null: false, type: :timestamp, precision: 6, index: true
      t.datetime    :valid_at,    null: true, type: :timestamp, precision: 6, index: true
    end

    add_foreign_key "event_store_events_in_streams", "event_store_events", column: "event_id", primary_key: "event_id"
  end
end
