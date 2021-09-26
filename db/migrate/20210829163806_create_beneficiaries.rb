class CreateBeneficiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :beneficiaries do |t|
      t.string :name
      t.string :document
      t.references :address, null: false, foreign_key: true
      t.string :birthDate

      t.timestamps
    end
  end
end
