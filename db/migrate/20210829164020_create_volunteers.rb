class CreateVolunteers < ActiveRecord::Migration[6.1]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :email
      t.string :telephone
      t.string :cpf
      t.string :identity
      t.references :address, null: false, foreign_key: true
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
