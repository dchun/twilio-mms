require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :content => "MyText",
      :media => "MyString",
      :sender => "MyString",
      :recipients => "",
      :recipient_type => "MyString",
      :user => nil
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "textarea#message_content[name=?]", "message[content]"

      assert_select "input#message_media[name=?]", "message[media]"

      assert_select "input#message_sender[name=?]", "message[sender]"

      assert_select "input#message_recipients[name=?]", "message[recipients]"

      assert_select "input#message_recipient_type[name=?]", "message[recipient_type]"

      assert_select "input#message_user_id[name=?]", "message[user_id]"
    end
  end
end
