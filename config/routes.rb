Rails.application.routes.draw do
  resources :buildings, only: [:index, :show, :edit, :update]
  resources :companies

  resources :offices, only: [:index, :show]

  # get '/offices', to: 'companies#index_of_offices', as: 'offices'
  # get '/offices/:id', to: 'companies#show_office', as:'show_office'
  delete '/employees/:id', to: 'companies#destroy_employee', as:'employee_delete'
  post '/employees', to: 'companies#add_employee', as: 'employees'
end
