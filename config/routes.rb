Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "menu", to: "pages#menu"
  resources :tournaments, only: %i[new create] do
    resources :players, only: %i[new create show]
    member do
      get :qualification
      get :demifinal
      get :final
      get :ranking
    end
  end
  resources :chickens, only: %i[show] do
    resources :players, only: %i[update]
  end
end
