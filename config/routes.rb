Rails.application.routes.draw do

  devise_for :admins
  root 'topics#index'

  get 'welcome/about'

  devise_for :users

  resources :topics do
    resources :bookmarks
  end
  
end
