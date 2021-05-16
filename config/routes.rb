Rails.application.routes.draw do
  devise_for :users
  root to: 'schedules#index'
  resources :users, only: [:edit, :update]
  resources :schedules do
    collection do
      get 'show_everyone'
    end
  end
  
end
