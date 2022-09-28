Rails.application.routes.draw do
  get 'homes/index'
  resources :articles
  root 'homes#index'
  # get 'homes/show'
  # get 'homes/edit'
  # get 'homes/update'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
