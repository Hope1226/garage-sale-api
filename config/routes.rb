Rails.application.routes.draw do
  resources :conversations, except: %i[update] do
    resources :messages, except: %i[update]
  end
  resources :ranks, only: %i[create update]
  resources :orders
  resources :products do
    resources :reviews
  end
  resources :stores
  devise_for :users,path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
