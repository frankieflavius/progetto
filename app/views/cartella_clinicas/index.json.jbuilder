json.array!(@cartella_clinicas) do |cartella_clinica|
  json.extract! cartella_clinica, :id, :diagnosi, :valutazione_anatomica, :valutazione_funzionale, :iniziale_finale, :anamnesi
  json.url cartella_clinica_url(cartella_clinica, format: :json)
end
