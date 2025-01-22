json.extract! avaliacao, :id, :nota, :comentario, :user_id, :produto_id, :created_at, :updated_at
json.url avaliacao_url(avaliacao, format: :json)
