json.extract! user, :id, :nome, :email, :senha, :localizacao, :created_at, :updated_at
json.url user_url(user, format: :json)
