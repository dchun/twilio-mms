require 'rails_helper'

RSpec.describe "TokenAuthenication", type: :request do
  it 'should log in user' do
    user = FactoryGirl.create :user
    get '/', params: {}, headers: { 'X-User-Email' => user.email, 'X-User-Token' => user.authentication_token }
    expect(response).to have_http_status(200)
  end

  it 'should redirect user' do
    get '/', params: {}, headers: { 'X-User-Email' => 'fake@email.com', 'X-User-Token' => 'randomtoken' }
    expect(response).to have_http_status(302)
  end
end
