class RemoveAddressFromBeneficiares < ActiveRecord::Migration[6.1]
  def change
    remove_column :beneficiaries, :address_id
  end
end
