class RemoveUserRoleFromVolunteers < ActiveRecord::Migration[6.1]
  def change
    remove_column :volunteers, :user_role, :string
  end
end
