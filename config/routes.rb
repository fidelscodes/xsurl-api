Rails.application.routes.draw do
  root 'links#index'

  resources :links

  get ':random_hex_string', to: 'links#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
