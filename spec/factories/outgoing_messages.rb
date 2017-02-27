FactoryGirl.define do
  factory :outgoing_message do
    zid "54321"
    name "John"
    sid "12345"
    number "12135555555"
    status "delivered"
    message
    user
  end
end
