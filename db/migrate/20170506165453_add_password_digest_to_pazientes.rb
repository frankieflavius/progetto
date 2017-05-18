class AddPasswordDigestToPazientes < ActiveRecord::Migration
  def change
    add_column :pazientes, :password_digest, :string
  end
end
