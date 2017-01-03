require 'rails_helper'

RSpec.describe "services/new", type: :view do
  before(:each) do
    assign(:service, Service.new(
      :name => "MyString",
      :service_id => "MyString",
      :authentication_token => "MyString",
      :user => nil
    ))
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "input#service_name[name=?]", "service[name]"

      assert_select "input#service_service_id[name=?]", "service[service_id]"

      assert_select "input#service_authentication_token[name=?]", "service[authentication_token]"

      assert_select "input#service_user_id[name=?]", "service[user_id]"
    end
  end
end
