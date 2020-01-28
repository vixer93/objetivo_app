Rails.application.routes.draw do
  root to: 'processes#index'
  root to: 'goals#now'
end
