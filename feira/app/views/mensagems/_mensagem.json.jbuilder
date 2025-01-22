json.extract! mensagem, :id, :mensagem, :user_id, :feirante_id, :created_at, :updated_at
json.url mensagem_url(mensagem, format: :json)
