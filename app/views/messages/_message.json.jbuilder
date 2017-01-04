json.extract! message, :id, :content, :media, :sender, :recipients, :recipient_type, :user_id, :created_at, :updated_at
json.url send_form_message_url(message)