Rails.application.routes.draw do
  get 'publications/new'
  post 'publications', to: 'publications#create'
  get 'publications/index'
  get 'publications/show'
  get 'publications/edit'

  patch 'publications/update', to: 'publications#update', as: 'publications_update'

  delete 'publications/delete', to: 'publications#delete', as: 'publications_delete'

  get 'homes/index'
  get 'homes/show'
  get 'homes/edit'
  get 'homes/update'
  root to: 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
