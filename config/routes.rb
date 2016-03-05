Rails.application.routes.draw do

  root 'topics#index'

  get 'welcome/about'

  devise_for :users

  resources :topics
end
