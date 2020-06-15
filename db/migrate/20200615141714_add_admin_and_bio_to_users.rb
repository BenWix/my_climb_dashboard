class AddAdminAndBioToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :bio, :string
  end
end
