RSpec.describe OutgoingMessagesController, type: :controller do
  login_user
  # This should return the minimal set of attributes required to create a valid
  # OutgoingMessage. As you add validations to OutgoingMessage, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OutgoingMessagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all outgoing_messages as @outgoing_messages" do
      outgoing_message = OutgoingMessage.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:outgoing_messages)).to eq([outgoing_message])
    end
  end

  describe "GET #show" do
    it "assigns the requested outgoing_message as @outgoing_message" do
      outgoing_message = OutgoingMessage.create! valid_attributes
      get :show, params: {id: outgoing_message.to_param}, session: valid_session
      expect(assigns(:outgoing_message)).to eq(outgoing_message)
    end
  end

end
