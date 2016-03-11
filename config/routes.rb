Rails.application.routes.draw do
  root 'topics#index'

  get 'welcome/about'

  devise_for :users

  get 'bookmark/index'
  
  resources :topics do
    resources :bookmarks, except: [:index]
  end

end
