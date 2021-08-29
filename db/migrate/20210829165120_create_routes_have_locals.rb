class CreateRoutesHaveLocals < ActiveRecord::Migration[6.1]
  def change
    create_table :routes_have_locals do |t|
      t.references :route, null: false, foreign_key: true
      t.references :local, null: false, foreign_key: true

      t.timestamps
    end
  end
end
