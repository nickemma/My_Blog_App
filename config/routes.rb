# Rails.application.routes.draw do
#   devise_for :users, sign_out_via: [:get, :post]
#   resources :users, only: [:index, :show] do
#     resources :posts, only: [:index, :show, :create, :new] do
#       resources :comments, only: [:create, :new]
#         resources :likes, only: [:create]
#     end
#   end
#     root to: 'users#index'
# end
