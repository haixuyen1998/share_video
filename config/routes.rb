Rails.application.routes.draw do
  root 'pages#home'
  resources :videos
  devise_for :users
end
