RSpec.describe "services/new", type: :view do
  before(:each) do
    @service = FactoryGirl.build(:service)
    assign(:service, @service)
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "input#service_name[name=?]", "service[name]"

      assert_select "input#service_service_id[name=?]", "service[service_id]"

      assert_select "input#service_authentication_token[name=?]", "service[authentication_token]"
    end
  end
end
