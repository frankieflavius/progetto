class CreateCartellaClinicas < ActiveRecord::Migration
  def change
    create_table :cartella_clinicas do |t|
      t.text :diagnosi
      t.text :valutazione_anatomica
      t.text :valutazione_funzionale
      t.text :iniziale_finale
      t.text :anamnesi

      t.timestamps null: false
    end
  end
end
