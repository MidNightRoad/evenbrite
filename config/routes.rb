Rails.application.routes.draw do
  
  resources :admin
  get '/', to: 'events#index'
  get 'static_pages/secret'
  resources :events do
  resources :orders, only: [:new, :create]
  resources :attendances,only: [:index]
  end
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :user

  namespace :admin do 
   resources :users, only: [:edit]
  end

end
