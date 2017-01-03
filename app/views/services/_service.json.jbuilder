json.extract! service, :id, :name, :service_id, :authentication_token, :user_id, :created_at, :updated_at
json.url service_url(service, format: :json)