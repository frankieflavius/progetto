class AddAdminToPazientes < ActiveRecord::Migration
  def change
    add_column :pazientes, :admin, :boolean
  end
end
