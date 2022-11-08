# frozen_string_literal: true

Rails.application.routes.draw do
  resources :publications do
    resources :requests
  end

  get 'reviews/new'
  post 'reviews', to: 'reviews#create'
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/edit'
  patch 'publications/:publication_id/reviews/:id', to: 'reviews#update', as: 'reviews_update'
  get 'users/profile'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/u/:id', to: 'users#profile', as: 'user'

  get 'publications/new'
  post 'publications', to: 'publications#create'
  get 'publications/index'
  get 'publications/show'
  get 'publications/edit'

  get 'requests/index', to: 'requests#index', as: 'requests_index'
  delete 'requests/destroy/:id', to: 'requests#destroy', as: 'requests_destroy'

  get 'requests/accept', to: 'requests#accept', as: 'requests_accept'

  patch 'publications/update/:id', to: 'publications#update', as: 'publications_update'

  delete 'publications/delete/:id', to: 'publications#delete', as: 'publications_delete'

  # >>>>>>> Develop-S1
  get 'homes/index'
  get 'homes/show'
  get 'homes/edit'
  get 'homes/update'
  root to: 'homes#index'

  resources :publications do
    resources :reviews
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
