RSpec.describe "TokenAuthenication", type: :request do
  let (:user) {FactoryGirl.create :user}

  it 'should log in user' do
    get '/', params: {}, headers: { 'X-User-Email' => user.email, 'X-User-Token' => user.authentication_token }
    expect(response).to have_http_status(200)
  end

  it 'should redirect user' do
    get '/', params: {}, headers: { 'X-User-Email' => 'fake@email.com', 'X-User-Token' => 'randomtoken' }
    expect(response).to have_http_status(302)
  end
end
