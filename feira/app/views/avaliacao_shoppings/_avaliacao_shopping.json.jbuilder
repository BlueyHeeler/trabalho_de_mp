json.extract! avaliacao_shopping, :id, :nota, :comentario, :usuario_id, :shopping_id, :created_at, :updated_at
json.url avaliacao_shopping_url(avaliacao_shopping, format: :json)
