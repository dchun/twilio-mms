require 'rails_helper'

RSpec.describe "messages/show", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :content => "MyText",
      :media => "Media",
      :sender => "Sender",
      :recipients => "",
      :recipient_type => "Recipient Type",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Media/)
    expect(rendered).to match(/Sender/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Recipient Type/)
    expect(rendered).to match(//)
  end
end
