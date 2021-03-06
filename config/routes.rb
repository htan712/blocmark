Rails.application.routes.draw do

  root 'topics#index'

  get 'welcome/about'

  mount_griddler

  devise_for :users

  resources :users, only: [:index, :show, :update, :destroy]

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks, only: [] do
    resources :likes, only: [:create, :destroy]
  end

end
