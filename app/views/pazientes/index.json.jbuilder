json.array!(@pazientes) do |paziente|
  json.extract! paziente, :id, :nome, :cognome, :email, :telefono

end
