Rails.application.routes.draw do
  devise_for :users
  root to: 'goals#now'
  resources :goals, only: :new
end
