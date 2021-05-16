Rails.application.routes.draw do
  get 'schedule_comments/index'
  devise_for :users
  root to: 'schedules#index'
  resources :users, only: [:edit, :update]
  resources :schedules do
    collection do
      get 'show_everyone'
      resources :schedule_comments
    end
  end
  
end
