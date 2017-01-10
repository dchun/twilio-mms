require 'rails_helper'

RSpec.describe "IncomingMessages", type: :request do
  describe "GET /incoming_messages" do
    it "works! (now write some real specs)" do
      get incoming_messages_path
      expect(response).to have_http_status(200)
    end
  end
end
