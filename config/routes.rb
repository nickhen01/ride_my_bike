Rails.application.routes.draw do
  devise_for :users
  root to: 'bicycles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bicycles do
    resources :bookings, except: [:index]
    get 'bookings', to: 'bookings#bicycle_bookings', as: :bookings_all
  end
  get 'bookings', to: 'bookings#user_bookings', as: :user_bookings

  resources :users, only: [:index] do
    resources :bicycles, only: [:index]
  end

  get 'bicycles-search', to: 'bicycles#search_results'
  get 'no-results', to: 'bicycles#no_results'
  get 'my-bikes', to: 'bicycles#my_bikes'
end
