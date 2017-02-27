RSpec.describe "messages/show", type: :view do
  before(:each) do
    @message = FactoryGirl.create(:message)
    assign(:message, @message)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/This is a test/)
    expect(rendered).to match(/Sender/)
    expect(rendered).to match(/12345222/)
    expect(rendered).to match(/zoho/)
  end
end
