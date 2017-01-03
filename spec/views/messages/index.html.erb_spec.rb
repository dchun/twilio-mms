require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :content => "MyText",
        :media => "Media",
        :sender => "Sender",
        :recipients => "",
        :recipient_type => "Recipient Type",
        :user => nil
      ),
      Message.create!(
        :content => "MyText",
        :media => "Media",
        :sender => "Sender",
        :recipients => "",
        :recipient_type => "Recipient Type",
        :user => nil
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Media".to_s, :count => 2
    assert_select "tr>td", :text => "Sender".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Recipient Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
