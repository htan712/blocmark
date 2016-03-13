Rails.application.routes.draw do

  root 'topics#index'

  get 'welcome/about'

  devise_for :users

  resources :users, only: [:index, :show]

  resources :topics do
    resources :bookmarks, except: [:index]
  end

end
