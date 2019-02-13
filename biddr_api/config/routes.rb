Rails.application.routes.draw do
  resources :auctions
  resources :users, only: [:new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]

  get("/", to: "welcome#index", as: :root)
  

end
