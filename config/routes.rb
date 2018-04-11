Rails.application.routes.draw do
  resources :wxlite_settings
  resources :orders, only: [:index, :show] do
    member do
      put 'confirm'
    end
  end

  resources :visitors
  mount Ckeditor::Engine => '/ckeditor'
  resources :products
  resources :catalogs
  devise_for :users
  root 'home#index'
  post 'get-upload-token', to: 'home#upload_token'
  mount RootAPI => '/'
  mount GrapeSwaggerRails::Engine => '/chunchun-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
