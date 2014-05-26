Rails.application.routes.draw do
 get "profiles/show"
  devise_for :users
  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'signin', to: 'devise/sessions#new',as: :signin
    get 'signout', to: 'devise/sessions#destroy', as: :signout
  end


  resources :posts
  resources :users

  root to: 'posts#index', as: :home
   get '/:id', to: 'profiles#show'
end
