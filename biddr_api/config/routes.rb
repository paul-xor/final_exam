Rails.application.routes.draw do
  resources :auctions
  get("/", to: "welcome#index", as: :root)
  

end
