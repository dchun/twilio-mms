require 'rails_helper'

RSpec.describe "services/show", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :name => "Name",
      :service_id => "Service",
      :authentication_token => "Authentication Token",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Service/)
    expect(rendered).to match(/Authentication Token/)
    expect(rendered).to match(//)
  end
end
