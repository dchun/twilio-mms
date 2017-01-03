require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  context "when not signed in" do
    describe "GET 'index'" do
      it "redirects to sign in" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  context "when signed in" do
    before do
      user = FactoryGirl.create(:user)
      sign_in(user)
    end
    describe 'GET :index' do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
  
end
