RSpec.describe IncomingMessagesController, type: :controller do
  login_user
  # This should return the minimal set of attributes required to create a valid
  # IncomingMessage. As you add validations to IncomingMessage, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IncomingMessagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all incoming_messages as @incoming_messages" do
      incoming_message = IncomingMessage.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:incoming_messages)).to eq([incoming_message])
    end
  end

  describe "GET #show" do
    it "assigns the requested incoming_message as @incoming_message" do
      incoming_message = IncomingMessage.create! valid_attributes
      get :show, params: {id: incoming_message.to_param}, session: valid_session
      expect(assigns(:incoming_message)).to eq(incoming_message)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new IncomingMessage" do
        expect {
          post :create, params: {incoming_message: valid_attributes}, session: valid_session
        }.to change(IncomingMessage, :count).by(1)
      end

      it "assigns a newly created incoming_message as @incoming_message" do
        post :create, params: {incoming_message: valid_attributes}, session: valid_session
        expect(assigns(:incoming_message)).to be_a(IncomingMessage)
        expect(assigns(:incoming_message)).to be_persisted
      end

      it "redirects to the created incoming_message" do
        post :create, params: {incoming_message: valid_attributes}, session: valid_session
        expect(response).to redirect_to(IncomingMessage.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved incoming_message as @incoming_message" do
        post :create, params: {incoming_message: invalid_attributes}, session: valid_session
        expect(assigns(:incoming_message)).to be_a_new(IncomingMessage)
      end

      it "re-renders the 'new' template" do
        post :create, params: {incoming_message: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

end
