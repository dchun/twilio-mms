module RequestMacros
  include Warden::Test::Helpers

  def sign_in_as_a_valid_user
    before(:each) do
      @user ||= FactoryGirl.create :user
      login_as @user    
      end
  end
end