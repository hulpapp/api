class CreateDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :donations do |t|
      t.string :category
      t.float :quantity
      t.string :position
      t.string :destination

      t.timestamps
    end
  end
end
