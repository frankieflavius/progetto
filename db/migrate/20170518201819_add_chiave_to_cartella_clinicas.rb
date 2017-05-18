class AddChiaveToCartellaClinicas < ActiveRecord::Migration
  def change
    add_column :cartella_clinicas, :chiave, :string
  end
end
