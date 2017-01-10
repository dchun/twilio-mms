json.extract! outgoing_message, :id, :zid, :name, :sid, :number, :status, :message_id, :user_id, :created_at, :updated_at
json.url outgoing_message_url(outgoing_message, format: :json)