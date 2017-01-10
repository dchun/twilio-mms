require 'rails_helper'

RSpec.describe "outgoing_messages/index", type: :view do
  before(:each) do
    assign(:outgoing_messages, [
      OutgoingMessage.create!(
        :zid => "Zid",
        :name => "Name",
        :sid => "Sid",
        :number => "Number",
        :status => "Status",
        :message => nil,
        :user => nil
      ),
      OutgoingMessage.create!(
        :zid => "Zid",
        :name => "Name",
        :sid => "Sid",
        :number => "Number",
        :status => "Status",
        :message => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of outgoing_messages" do
    render
    assert_select "tr>td", :text => "Zid".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sid".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
