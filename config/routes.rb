Rails.application.routes.draw do
  devise_for :users
  root to: 'goals#now'
  resources :goals, only: [:new, :create] do
    patch 'pend', to: 'goals#pend'
    patch 'give_up', to: 'goals#give_up'
    resources :stages do
      resources :todos, only: [:index, :create, :destroy]
    end
  end
end