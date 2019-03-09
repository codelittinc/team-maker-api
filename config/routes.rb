Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/docs')

  resources :roles

  resources :resources

  resources :resource_types

  resources :tags

  resources :schedules
end
