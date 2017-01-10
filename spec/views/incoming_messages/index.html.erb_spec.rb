require 'rails_helper'

RSpec.describe "incoming_messages/index", type: :view do
  before(:each) do
    assign(:incoming_messages, [
      IncomingMessage.create!(
        :sid => "Sid",
        :number => "Number",
        :content => "MyText",
        :user => nil
      ),
      IncomingMessage.create!(
        :sid => "Sid",
        :number => "Number",
        :content => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of incoming_messages" do
    render
    assert_select "tr>td", :text => "Sid".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
