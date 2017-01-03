require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :content => "MyText",
      :media => "MyString",
      :sender => "MyString",
      :recipients => "",
      :recipient_type => "MyString",
      :user => nil
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "textarea#message_content[name=?]", "message[content]"

      assert_select "input#message_media[name=?]", "message[media]"

      assert_select "input#message_sender[name=?]", "message[sender]"

      assert_select "input#message_recipients[name=?]", "message[recipients]"

      assert_select "input#message_recipient_type[name=?]", "message[recipient_type]"

      assert_select "input#message_user_id[name=?]", "message[user_id]"
    end
  end
end
