require "rails_helper"

RSpec.describe OutgoingMessagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/outgoing_messages").to route_to("outgoing_messages#index")
    end

    it "routes to #show" do
      expect(:get => "/outgoing_messages/1").to route_to("outgoing_messages#show", :id => "1")
    end

  end
end
