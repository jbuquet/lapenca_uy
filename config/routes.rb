LapencaUy::Application.routes.draw do
  devise_for :members

  resources :teams
  resources :arenas
  resources :matches
  resources :forecasts

  get "static_pages/home"
  match '/home', to: 'static_pages#home', via: 'get'

  root 'static_pages#home'
end
