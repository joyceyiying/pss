Rails.application.routes.draw do
  resources :psses
  
  root 'game#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
