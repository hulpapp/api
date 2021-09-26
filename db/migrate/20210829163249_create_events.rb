class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :detail
      t.string :date
      t.string :startDate
      t.string :endDate

      t.timestamps
    end
  end
end
