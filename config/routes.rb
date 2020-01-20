Rails.application.routes.draw do
  resources :buildings, only: [:index, :show, :edit, :update]
  resources :offices, only: [:index, :show]
  resources :companies, only: [:index, :show, :new, :create, :edit, :update]
  resources :employees, only: [:index, :show, :new, :create, :destroy]
  # resources :employees
end
