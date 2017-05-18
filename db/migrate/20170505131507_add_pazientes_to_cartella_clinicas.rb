class AddPazientesToCartellaClinicas < ActiveRecord::Migration
  def change
    add_reference :cartella_clinicas, :paziente, index: true, foreign_key: true
  end
end
