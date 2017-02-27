RSpec.describe "services/edit", type: :view do
  before(:each) do
    @service = FactoryGirl.create(:service)
    assign(:service, @service)
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(@service), "post" do

      assert_select "input#service_name[name=?]", "service[name]"

      assert_select "input#service_service_id[name=?]", "service[service_id]"

      assert_select "input#service_authentication_token[name=?]", "service[authentication_token]"
    end
  end
end
