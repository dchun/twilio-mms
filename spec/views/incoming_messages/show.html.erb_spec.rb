RSpec.describe "incoming_messages/show", type: :view do
  before(:each) do
    @incoming_message = FactoryGirl.create(:incoming_message)
    assign(:incoming_message, @incoming_message)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1234/)
    expect(rendered).to match(/12135555555/)
    expect(rendered).to match(/this is a text/)
  end
end
