Rails.application.routes.draw do
  resources :auctions do
    resources :bids, only: [:create, :destroy]
  end
  get("/", to: "welcome#index", as: :root)
  get 'signup', to: "users#new"
  resources :users, except: [:new]

end
