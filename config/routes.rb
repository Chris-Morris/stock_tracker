Rails.application.routes.draw do
  resources :stocks
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get '/stocksjson', to: "stocks#fetch_stocks"

  get 'stocks/:id/general', to: "stocks#general"
  get 'stocks/:id/highlights', to: "stocks#highlights"
  get 'stocks/:id/valuation', to: "stocks#valuation"
  get 'stocks/:id/analystratings', to: "stocks#analyst_ratings"
  get 'stocks/:id/earnings', to: "stocks#earnings"
  get 'stocks/:id/financials', to: "stocks#financials"
end
