RSpec.describe MessagesController, type: :controller do
  login_user
  # This should return the minimal set of attributes required to create a valid
  # Message. As you add validations to Message, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MessagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all messages as @messages" do
      message = Message.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:messages)).to eq([message])
    end
  end

  describe "GET #show" do
    it "assigns the requested message as @message" do
      message = Message.create! valid_attributes
      get :show, params: {id: message.to_param}, session: valid_session
      expect(assigns(:message)).to eq(message)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, params: {message: valid_attributes}, session: valid_session
        }.to change(Message, :count).by(1)
      end

      it "assigns a newly created message as @message" do
        post :create, params: {message: valid_attributes}, session: valid_session
        expect(assigns(:message)).to be_a(Message)
        expect(assigns(:message)).to be_persisted
      end

      it "redirects to the created message" do
        post :create, params: {message: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Message.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved message as @message" do
        post :create, params: {message: invalid_attributes}, session: valid_session
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "re-renders the 'new' template" do
        post :create, params: {message: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

end
