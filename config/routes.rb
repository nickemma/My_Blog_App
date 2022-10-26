Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      post 'comments', to: 'comments#create'
      post 'likes', to: 'likes#create'
    end
  end
    root to: 'users#index'
end
