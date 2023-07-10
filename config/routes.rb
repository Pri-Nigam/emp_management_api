Rails.application.routes.draw do
  namespace :api do
    resources :employees do
      collection do
        get 'department_employees'
      end
      resources :tasks
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
