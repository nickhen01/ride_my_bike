Rails.application.routes.draw do
  devise_for :users
  root to: 'bicycles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :bicycles, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :bicycles, only: [:index, :show]
end
