Rails.application.routes.draw do
  resources :payments do
    collection do
      post :webhook
    end
  end
  resources :incoming_messages
  resources :outgoing_messages do
    collection do
      post :update_status
    end
  end
  resources :services
  resources :messages do
    member do
      get :send_form
      put :twilio_send
      patch :twilio_send
    end
  end

  get 'home/index'

  devise_for :users, 
    controllers: {
      sessions: "sessions"
    }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end