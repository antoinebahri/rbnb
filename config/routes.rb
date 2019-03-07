Rails.application.routes.draw do

  resources :flats, only: [:index, :new, :show, :edit, :create, :update, :destroy]

  resources :flats do
  resources :bookings, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  end

  devise_for :users

  root to: 'pages#home'

  get '/contact', to: 'pages#contact'
  get '/dashboard/trips', to: 'pages#trips'
  get '/dashboard/bookings', to: 'pages#bookings'
  get '/dashboard/places', to: 'pages#places'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# Prefix Verb   URI Pattern                                           Controller#Action
#             flats GET    /flats(.:format)                                      flats#index
#                   POST   /flats(.:format)                                      flats#create
#          new_flat GET    /flats/new(.:format)                                  flats#new
#         edit_flat GET    /flats/:id/edit(.:format)                             flats#edit
#              flat GET    /flats/:id(.:format)                                  flats#show
#                   PATCH  /flats/:id(.:format)                                  flats#update
#                   PUT    /flats/:id(.:format)                                  flats#update
#                   DELETE /flats/:id(.:format)                                  flats#destroy
#     flat_bookings GET    /flats/:flat_id/bookings(.:format)                    bookings#index
#                   POST   /flats/:flat_id/bookings(.:format)                    bookings#create
#  new_flat_booking GET    /flats/:flat_id/bookings/new(.:format)                bookings#new
# edit_flat_booking GET    /flats/:flat_id/bookings/:id/edit(.:format)           bookings#edit
#      flat_booking GET    /flats/:flat_id/bookings/:id(.:format)                bookings#show
#                   PATCH  /flats/:flat_id/bookings/:id(.:format)                bookings#update
#                   PUT    /flats/:flat_id/bookings/:id(.:format)                bookings#update
#                   DELETE /flats/:flat_id/bookings/:id(.:format)                bookings#destroy
#                   GET    /flats(.:format)                                      flats#index
#                   POST   /flats(.:format)                                      flats#create
#                   GET    /flats/new(.:format)                                  flats#new
#                   GET    /flats/:id/edit(.:format)                             flats#edit
#                   GET    /flats/:id(.:format)                                  flats#show
#                   PATCH  /flats/:id(.:format)                                  flats#update
#                   PUT    /flats/:id(.:format)                                  flats#update
#                   DELETE /flats/:id(.:format)                                  flats#delete
# dashboard_trips   GET    /dashboard/trips(.:format)                            pages#trips
# dashboard_bookingsGET    /dashboard/bookings(.:format)                         pages#bookings
# dashboard_places  GET    /dashboard/places(.:format)                           pages#places

