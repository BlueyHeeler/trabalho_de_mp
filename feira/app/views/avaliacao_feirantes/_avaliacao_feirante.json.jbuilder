json.extract! avaliacao_feirante, :id, :nota, :comentario, :usuario_id, :feirante_id, :created_at, :updated_at
json.url avaliacao_feirante_url(avaliacao_feirante, format: :json)
