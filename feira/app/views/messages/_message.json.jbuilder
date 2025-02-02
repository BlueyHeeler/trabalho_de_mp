json.extract! message, :id, :texto, :user_id, :feirante_id, :created_at, :updated_at
json.url message_url(message, format: :json)
