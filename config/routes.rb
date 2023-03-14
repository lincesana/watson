Rails.application.routes.draw do
  get 'categories/new'
  devise_for :users
  root to: "searches#index"
  # NOTE! once the path exists change to >> root to: "searches#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  resources :searches do
    resources :bookmarks, only: %i[create]
  end
  resources :bookmarks, only: %i[index show destroy] do
    post "/bookmarks_categories", to: "bookmark_categories#create", as: :categories
  end
  resources :user_categories, only: %i[new create destroy]
end
