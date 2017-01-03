Rails.application.routes.draw do
  resources :services
  resources :messages do
    member do
      get :send_form
      put :send_message
      patch :send_message
    end
  end

  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end