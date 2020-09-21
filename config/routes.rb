Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flights
  resources :airlines
  resources :passengers, only: [:index]
  scope :flights do
    delete '/passengers/:id', to: 'passenger_flights#destroy', as: 'remove_passenger'
  end 
end
