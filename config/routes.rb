Rails.application.routes.draw do
  devise_for :users

  #動作確認用 終わったら消す
  root to: 'stages#index'
  #ここまで
  
  root to: 'goals#now'
  resources :goals, only: [:new, :create] do
    resources :stages
  end
end