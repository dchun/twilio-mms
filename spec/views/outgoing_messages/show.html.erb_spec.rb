require 'rails_helper'

RSpec.describe "outgoing_messages/show", type: :view do
  before(:each) do
    @outgoing_message = assign(:outgoing_message, OutgoingMessage.create!(
      :zid => "Zid",
      :name => "Name",
      :sid => "Sid",
      :number => "Number",
      :status => "Status",
      :message => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Zid/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Sid/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
