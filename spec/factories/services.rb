FactoryGirl.define do
  factory :service do
    name "twilio"
    service_id 1
    authentication_token "token"
    user
  end
end
