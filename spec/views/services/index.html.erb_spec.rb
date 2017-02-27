RSpec.describe "services/index", type: :view do
  before(:each) do
    @twilio = FactoryGirl.create(:service)
    @zoho = FactoryGirl.create(:service, name: "zoho", service_id: "module", authentication_token: "token")
    assign(:services, [@twilio, @zoho])
    current_user = @twilio.user   
    allow(view).to receive(:current_user).and_return(current_user)
    allow(view).to receive_messages(:paginate => nil)
  end

  it "renders a list of services" do
    render
    expect(rendered).to match(/twilio/)
    expect(rendered).to match(/zoho/)
  end
end
