Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "prototypes#index"
  # アソシエーション先のレコードのidをparamsに追加してコントローラーに送るためにルーティングをネストさせている
  resources :prototypes do
    resources :comments, only: :create
  end
  resources :prototypes, only:[:new, :create, :show, :edit, :update, :destroy]
  resources :users, only: :show
end

