class AddNeighborhoodToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :neighborhood, :string
  end
end
