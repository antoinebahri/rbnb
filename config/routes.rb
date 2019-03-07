Rails.application.routes.draw do

  resources :flats, only: [:index, :new, :show, :edit, :create, :update, :destroy]

  resources :flats do
  resources :bookings, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
