Rails.application.routes.draw do
  resources :stocks
  devise_for :users
  root "home#index"
  get 'stocks/:id/highlights', to: "stocks#highlights"
  get 'stocks/:id/valuation', to: "stocks#valuation"
  get 'stocks/:id/analystratings', to: "stocks#analyst_ratings"
  get 'stocks/:id/earnings', to: "stocks#earnings"
  get 'stocks/:id/financials', to: "stocks#financials"
end
