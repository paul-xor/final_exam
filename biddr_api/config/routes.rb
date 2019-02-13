Rails.application.routes.draw do
  resources :auctions do
    resources :bids, only: [:create, :destroy]
  end
  get("/", to: "welcome#index", as: :root)
  

end
