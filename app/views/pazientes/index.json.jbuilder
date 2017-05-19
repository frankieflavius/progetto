json.array!(@pazientes) do |paziente|
  json.extract! paziente, :id, :nome, :cognome, :email, :telefono
  json.url paziente_url(paziente, format: :json)
end
