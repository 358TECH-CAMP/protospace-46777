Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  root to: "prototypes#index"
 # ユーザー詳細ページ用（追加）
  resources :users, only: :show
  resources :prototypes, only: [:index, :new, :create, :destroy, :edit, :update, :show] do
  resources :comments, only: :create
  end
end
