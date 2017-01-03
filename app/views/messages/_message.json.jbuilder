json.extract! message, :id, :content, :media, :sender, :recipients, :recipient_type, :user_id, :created_at, :updated_at
json.url message_url(message, format: :json)