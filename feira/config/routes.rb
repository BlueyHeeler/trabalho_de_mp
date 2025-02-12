Rails.application.routes.draw do
  resources :avaliacao_feirantes
  resources :avaliacao_shoppings
  resources :messages
  resources :shoppings
  resources :avaliacaos
  resources :wish_lists, only: [ :index, :create, :destroy ]
  resources :produtos
  resources :feirantes
  resources :administradors
  resources :users

  root "home#start_page" # Página inicial
  get "home/start_page" => "home#start_page", as: :start_page  
  get "home/login" => "home#login"
  get "home/feira" => "home#feira"
  get "home/feira/sort" => "home#feira", as: :sort_feira
  get "home/feirantes/:shopping_id" => "home#feirantes", as: :home_feirantes
  get "home/produtos_feirantes/:feirante_id" => "home#produtos_feirantes", as: :produtos_feirantes
  get "home/anotacoes" => "home#anotacoes"
  get "home/adicionar/:produto_id" => "home#adicionar", as: :adicionar
  get "home/admin_homepage" => "home#admin_homepage", as: :home_admin_homepage
  get "home/feirante_homepage" => "home#feirante_homepage", as: :home_feirante_homepage
  get "home/admin_feirantes" => "home#admin_feirantes", as: :home_admin_feirantes

  get "login", to: "home#login"
  post "login", to: "home#authenticate"
  delete "logout", to: "home#logout"
  post "create_temp_user", to: "home#create_temp_user"
  post 'users/create_temp_user', to: 'users#create_temp_user'

  get "up" => "rails/health#show", as: :rails_health_check
end
