class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :street
      t.integer :number
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
