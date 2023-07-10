Rails.application.routes.draw do
  namespace :api do
    get '/employees/:employee_id/attendances/:date', to: 'attendances#show'
    resources :employees do
      collection do
        get 'department_employees'
      end
      resources :tasks
      resources :attendances, except: :show
    end
  end
end
