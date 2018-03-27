Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :products
  resources :catalogs
  devise_for :users
  root 'home#index'
  post 'get-upload-token', to: 'home#get_upload_token'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
