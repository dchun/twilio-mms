RSpec.describe PaymentsController, type: :controller do
  login_user

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all payments as @payments" do
      payment = Payment.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:payments)).to eq([payment])
    end
  end

  describe "GET #show" do
    it "assigns the requested payment as @payment" do
      payment = Payment.create! valid_attributes
      get :show, params: {id: payment.to_param}, session: valid_session
      expect(assigns(:payment)).to eq(payment)
    end
  end

  describe "GET #new" do
    it "assigns a new payment as @payment" do
      get :new, params: {}, session: valid_session
      expect(assigns(:payment)).to be_a_new(Payment)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Payment" do
        expect {
          post :create, params: {payment: valid_attributes}, session: valid_session
        }.to change(Payment, :count).by(1)
      end

      it "assigns a newly created payment as @payment" do
        post :create, params: {payment: valid_attributes}, session: valid_session
        expect(assigns(:payment)).to be_a(Payment)
        expect(assigns(:payment)).to be_persisted
      end

      it "redirects to the created payment" do
        post :create, params: {payment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Payment.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved payment as @payment" do
        post :create, params: {payment: invalid_attributes}, session: valid_session
        expect(assigns(:payment)).to be_a_new(Payment)
      end

      it "re-renders the 'new' template" do
        post :create, params: {payment: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
