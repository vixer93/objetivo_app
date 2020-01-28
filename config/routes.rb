Rails.application.routes.draw do
  devise_for :users
  root to: 'processes#index'
  root to: 'goals#now'
  resources :goals, only: [:new, :create] do
    resources :processes
  end
end