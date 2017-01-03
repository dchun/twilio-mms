require 'rails_helper'

RSpec.describe "services/index", type: :view do
  before(:each) do
    assign(:services, [
      Service.create!(
        :name => "Name",
        :service_id => "Service",
        :authentication_token => "Authentication Token",
        :user => nil
      ),
      Service.create!(
        :name => "Name",
        :service_id => "Service",
        :authentication_token => "Authentication Token",
        :user => nil
      )
    ])
  end

  it "renders a list of services" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Service".to_s, :count => 2
    assert_select "tr>td", :text => "Authentication Token".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
