Rails.application.routes.draw do
  resources :buildings, only: [:index, :show, :edit, :update]
  resources :companies

  get '/offices/:id', to: 'companies#show_office', as:'show_office'
  delete '/employees/:id', to: 'companies#destroy_employee', as:'employee_delete'
  post '/employees', to: 'companies#add_employee', as: 'employees'
end
