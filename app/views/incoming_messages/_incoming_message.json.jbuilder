json.extract! incoming_message, :id, :sid, :number, :content, :user_id, :created_at, :updated_at
json.url incoming_message_url(incoming_message, format: :json)