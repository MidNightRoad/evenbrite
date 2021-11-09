Rails.application.routes.draw do
  get '/', to: 'static_pages#index'
  get 'static_pages/secret'
  resources :events
  devise_for :users
  resources :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
