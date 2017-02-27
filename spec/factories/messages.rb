FactoryGirl.define do
  factory :message do
    content "This is a test"
    media "link"
    sender_name "Sender"
    sender_number "12345222"
    recipients [{"id"=>"1978402000003516013", "name"=>"J d", "number"=>"310-425-5775"}, {"id"=>"1978402000003516039", "name"=>"D C", "number"=>"4244420347"}]
    recipient_type "zoho"
    user
  end
end
