RSpec.describe "incoming_messages/index", type: :view do
  before(:each) do
    assign(:incoming_messages, FactoryGirl.create_list(:incoming_message, 2))
    allow(view).to receive_messages(:paginate => nil)
  end

  it "renders a list of incoming_messages" do
    render
    assert_select "tr>td", :text => "12345".to_s, :count => 2
    assert_select "tr>td", :text => "12135555555".to_s, :count => 2
    assert_select "tr>td", :text => "this is a text".to_s, :count => 2
  end
end
