FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "john#{n}@doe.com"
    end
    password "secret123"
    authentication_token "ajhb7^guyaGF%$"
  end
end