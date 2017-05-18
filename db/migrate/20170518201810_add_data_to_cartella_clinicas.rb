class AddDataToCartellaClinicas < ActiveRecord::Migration
  def change
    add_column :cartella_clinicas, :data, :string
  end
end
