LapencaUy::Application.routes.draw do
  devise_for :members, :controllers => {:registrations => 'registrations'}

  resources :teams, only: [:index, :show], path: 'equipos'
  resources :arenas, only: [:index, :show], path: 'estadios'
  resources :matches, only: [:index, :update], path: 'resultados'

  resources :forecasts, only: [:index, :create], path: 'pronostico'

  root 'standings#show'
end