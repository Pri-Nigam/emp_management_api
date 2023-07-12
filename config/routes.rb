Rails.application.routes.draw do
  namespace :api do
    get '/employees/:employee_id/attendances/:date', to: 'attendances#show'
    get '/employees/:employee_id/leaves_applied', to: 'leaves#leaves_applied'
    resources :employees do
      collection do
        get 'department_employees'
      end
      resources :tasks
      resources :attendances, except: :show
      resources :leaves
    end
  end
end
