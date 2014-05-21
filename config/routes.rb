LapencaUy::Application.routes.draw do
  devise_for :members

  resources :teams, only: [:index, :show]
  resources :arenas, only: [:index, :show]
  resources :matches, only: [:index, :show, :update]

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
