class CreateEventPlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :event_places do |t|
      t.references :event, null: false, foreign_key: true
      t.string :placeid
      t.string :name
      t.string :address
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
