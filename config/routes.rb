Rails.application.routes.draw do
  devise_for :users
  root to: 'goals#now'
  resources :goals, only: [:new, :create] do
    patch 'give_up', to: 'goals#give_up'
    resources :stages do
      resources :todos, only: [:index, :create]
    end
  end
end