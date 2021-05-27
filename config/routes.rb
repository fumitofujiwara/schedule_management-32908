Rails.application.routes.draw do
  get 'schedule_comments/index'
  devise_for :users
  root to: 'schedules#index'
  resources :users, only: [:edit, :update]
  resources :schedules do
    collection do
      get 'show_myself'
      get 'show_everyone'
    end
    resources :schedule_comments
    resources :reports
  end
  
end
