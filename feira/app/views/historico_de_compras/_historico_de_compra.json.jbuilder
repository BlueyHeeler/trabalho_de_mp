json.extract! historico_de_compra, :id, :quantidade, :user_id, :produto_id, :created_at, :updated_at
json.url historico_de_compra_url(historico_de_compra, format: :json)
