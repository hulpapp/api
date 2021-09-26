class CreateDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :drivers do |t|
      t.references :volunteer, null: false, foreign_key: true
      t.string :vehicle

      t.timestamps
    end
  end
end
