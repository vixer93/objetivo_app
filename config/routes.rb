Rails.application.routes.draw do
  devise_for :users
  root to: 'processes#index'
  root to: 'goals#now'
end