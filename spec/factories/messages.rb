FactoryGirl.define do
  factory :message do
    content "MyText"
    media "MyString"
    sender "MyString"
    recipients ""
    recipient_type "MyString"
    user nil
  end
end
