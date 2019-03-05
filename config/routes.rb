Rails.application.routes.draw do
  resources :flats, only: [:new, :show, :edit, :create, :update, :destroy]

  devise_for :users
  root to: 'pages#home'
  get '/contact', to: 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
