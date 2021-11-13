class RemoveCountryFromAddresses < ActiveRecord::Migration[6.1]
  def change
    remove_column :addresses, :country
  end
end
