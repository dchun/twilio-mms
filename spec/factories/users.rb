FactoryGirl.define do
  factory :user do
    # sequence :email do |n|
    #   "john#{n}@doe.com"
    # end
    email "john@doe.com"
    password "secret123"
    authentication_token "ajhb7^guyaGF%$"
    valid_until Date.today + 1.month
    initialize_with { User.find_or_create_by(email: email) } 
  end
end