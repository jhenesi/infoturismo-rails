Infoturismo::Application.routes.draw do
  root 'home#index'
  resources :overview
  resources :acceso do
  	collection do
  		get 'senalamiento'
  	end
  end
  resources :atractivos
  resources :consumo
  resources :costo
  resources :experiencia
  resources :imagen
  resources :satisfaccion
end
