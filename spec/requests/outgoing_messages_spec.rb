RSpec.describe "OutgoingMessages", type: :request do
  sign_in_as_a_valid_user
  
  describe "GET /outgoing_messages" do
    it "works! (now write some real specs)" do
      get outgoing_messages_path
      expect(response).to have_http_status(200)
    end
  end
end
