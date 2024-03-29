RSpec.describe ServicesController, type: :controller do
  login_user
  # This should return the minimal set of attributes required to create a valid
  # Service. As you add validations to Service, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ServicesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all services as @services" do
      service = Service.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:services)).to eq([service])
    end
  end

  describe "GET #show" do
    it "assigns the requested service as @service" do
      service = Service.create! valid_attributes
      get :show, params: {id: service.to_param}, session: valid_session
      expect(assigns(:service)).to eq(service)
    end
  end

  describe "GET #new" do
    it "assigns a new service as @service" do
      get :new, params: {}, session: valid_session
      expect(assigns(:service)).to be_a_new(Service)
    end
  end

  describe "GET #edit" do
    it "assigns the requested service as @service" do
      service = Service.create! valid_attributes
      get :edit, params: {id: service.to_param}, session: valid_session
      expect(assigns(:service)).to eq(service)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Service" do
        expect {
          post :create, params: {service: valid_attributes}, session: valid_session
        }.to change(Service, :count).by(1)
      end

      it "assigns a newly created service as @service" do
        post :create, params: {service: valid_attributes}, session: valid_session
        expect(assigns(:service)).to be_a(Service)
        expect(assigns(:service)).to be_persisted
      end

      it "redirects to the created service" do
        post :create, params: {service: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Service.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved service as @service" do
        post :create, params: {service: invalid_attributes}, session: valid_session
        expect(assigns(:service)).to be_a_new(Service)
      end

      it "re-renders the 'new' template" do
        post :create, params: {service: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested service" do
        service = Service.create! valid_attributes
        put :update, params: {id: service.to_param, service: new_attributes}, session: valid_session
        service.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested service as @service" do
        service = Service.create! valid_attributes
        put :update, params: {id: service.to_param, service: valid_attributes}, session: valid_session
        expect(assigns(:service)).to eq(service)
      end

      it "redirects to the service" do
        service = Service.create! valid_attributes
        put :update, params: {id: service.to_param, service: valid_attributes}, session: valid_session
        expect(response).to redirect_to(service)
      end
    end

    context "with invalid params" do
      it "assigns the service as @service" do
        service = Service.create! valid_attributes
        put :update, params: {id: service.to_param, service: invalid_attributes}, session: valid_session
        expect(assigns(:service)).to eq(service)
      end

      it "re-renders the 'edit' template" do
        service = Service.create! valid_attributes
        put :update, params: {id: service.to_param, service: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

end
