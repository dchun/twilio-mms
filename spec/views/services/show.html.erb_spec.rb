RSpec.describe "services/show", type: :view do
  before(:each) do
    @service = FactoryGirl.create(:service)
    assign(:service, @service)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/twilio/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/token/)
    expect(rendered).to match(/john@doe.com/)
  end
end
