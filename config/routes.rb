LapencaUy::Application.routes.draw do
  devise_for :members

  resources :teams
  resources :arenas
  resources :matches
  resources :forecasts do
    collection do
      get :forecast
      post :forecast, action: :save_forecast
    end
  end

  get 'static_pages/home'
  match '/home', to: 'static_pages#home', via: 'get'

  root 'static_pages#home'
end
