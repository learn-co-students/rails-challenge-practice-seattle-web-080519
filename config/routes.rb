Rails.application.routes.draw do
  resources :buildings, only: [:index, :show, :edit, :update]
  resources :companies

  post '/employees', to: 'companies#add_employee', as: 'employees'
end
