RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, FactoryGirl.create_list(:message, 2))
    allow(view).to receive_messages(:paginate => nil)
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "This is a test".to_s, :count => 2
    assert_select "tr>td", :text => "Sender".to_s, :count => 2
    assert_select "tr>td", :text => "12345222".to_s, :count => 2
    assert_select "tr>td", :text => "zoho".to_s, :count => 2
  end
end
