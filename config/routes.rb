Rails.application.routes.draw do
  resources :scans
  resources :stocks do
    get :highlights, on: :member
    get :ratios, on: :member
    get :valuation, on: :member
    get :analyst_ratings, on: :member
    get :earnings, on: :member
    get :financials, on: :member

    collection do
      get 'list'
    end
  end

  get "economic_calendar", to: "economic_calendar#index"
  devise_for :users
  root "home#index"
end
