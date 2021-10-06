Rails.application.routes.draw do
  root 'homes#top'
  devise_for :end_users
  resources :end_users, only: [:index, :show, :edit, :update]
  get 'mypage/:id' => 'end_users#mypage', as: 'mypage'
  get 'my_favorite/:id' => 'end_users#my_favorite', as: 'my_favorite'
  resources :records, only: [:index, :show, :edit, :update, :create, :new, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
end
