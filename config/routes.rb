Rails.application.routes.draw do
  root to: 'static#home'
  get 'static/home'
  devise_for :users
  resources :dashboard do
    collection do
      get :news_feed
      get :profile
    end
  end
end
