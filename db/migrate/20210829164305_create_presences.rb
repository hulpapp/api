class CreatePresences < ActiveRecord::Migration[6.1]
  def change
    create_table :presences do |t|
      t.string :date
      t.string :startDate
      t.string :endDate
      t.references :volunteer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
