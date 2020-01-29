Rails.application.routes.draw do
  devise_for :users
  root to: 'goals#now'
  resources :goals, only: [:new, :create] do
    resources :stages do
      resources :todos, only: [:index, :create]
    end
  end
end