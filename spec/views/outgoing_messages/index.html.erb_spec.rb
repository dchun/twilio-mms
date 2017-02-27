RSpec.describe "outgoing_messages/index", type: :view do
  before(:each) do
    assign(:outgoing_messages, FactoryGirl.create_list(:outgoing_message, 2))
    allow(view).to receive_messages(:paginate => nil)
  end

  it "renders a list of outgoing_messages" do
    render
    assert_select "tr>td", :text => "54321".to_s, :count => 2
    assert_select "tr>td", :text => "John".to_s, :count => 2
    assert_select "tr>td", :text => "12345".to_s, :count => 2
    assert_select "tr>td", :text => "12135555555".to_s, :count => 2
    assert_select "tr>td", :text => "delivered".to_s, :count => 2
  end
end
