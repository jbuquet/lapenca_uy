LapencaUy::Application.routes.draw do
  devise_for :members

  get "static_pages/home"
  match '/home', to: 'static_pages#home', via: 'get'

  root 'static_pages#home'
end
