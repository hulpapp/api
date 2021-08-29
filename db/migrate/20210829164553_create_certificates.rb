class CreateCertificates < ActiveRecord::Migration[6.1]
  def change
    create_table :certificates do |t|
      t.references :presence, null: false, foreign_key: true
      t.references :volunteer, null: false, foreign_key: true
      t.string :date
      t.references :organizer, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
