class AddCityToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :city, :string
  end
end
