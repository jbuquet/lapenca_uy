LapencaUy::Application.routes.draw do
  devise_for :members, :controllers => {:registrations => 'registrations'}

  resources :matches, only: [:index, :show], path: 'resultados' do
    collection do
      resources :results, only: [:index, :create], path: 'actualizar'
    end
  end

  resources :points, only: [:index, :create], path: 'puntos' do
    collection do
      post 'recalcular', :action => 'recalculate'
    end
  end
  resources :forecasts, only: [:index, :create], path: 'pronostico'

  get 'reglas', to: 'static_pages#rules'

  root 'standings#show'
end