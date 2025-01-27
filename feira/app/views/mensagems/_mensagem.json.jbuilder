json.extract! mensagem, :id, :mensagem, :data, :usuario_id, :feirante_id, :created_at, :updated_at
json.url mensagem_url(mensagem, format: :json)
