class CreateGambis < ActiveRecord::Migration[7.0]
  def change
    create_table :gambis do |t|
      t.references :volunteer, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :supermercado
      t.datetime :horaEntrada
      t.datetime :horaSaida

      t.timestamps
    end
  end
end
