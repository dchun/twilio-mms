require "rails_helper"

RSpec.describe IncomingMessagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/incoming_messages").to route_to("incoming_messages#index")
    end

    it "routes to #show" do
      expect(:get => "/incoming_messages/1").to route_to("incoming_messages#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/incoming_messages").to route_to("incoming_messages#create")
    end

  end
end
