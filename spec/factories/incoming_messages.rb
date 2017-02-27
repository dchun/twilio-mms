FactoryGirl.define do
  factory :incoming_message do
    sid "12345"
    number "12135555555"
    content "this is a text"
    user
  end
end
