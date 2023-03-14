Rails.application.routes.draw do
  devise_for :users
  root to: "searches#index"
  # NOTE! once the path exists change to >> root to: "searches#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  resources :searches do
    resources :bookmarks, only: %i[create]
    resources :reviews, only: %i[create]
  end
  resources :bookmarks, only: %i[new create index show destroy]
  resources :reviews, only: %i[destroy]
end
