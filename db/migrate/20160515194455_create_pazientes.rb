class CreatePazientes < ActiveRecord::Migration
  def change
    create_table :pazientes do |t|
      t.string :nome
      t.string :cognome
      t.string :email
      t.string :telefono
      
      t.timestamps null: false
    end
  end
end
