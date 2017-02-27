RSpec.describe "Messages", type: :request do
  sign_in_as_a_valid_user
  
  describe "GET /messages" do
    it "works! (now write some real specs)" do
      get messages_path
      expect(response).to have_http_status(200)
    end
  end
end
