Rails.application.routes.draw do
resources :user, only: [:new, :index, :show, :edit]
resources :book, only: [:new, :index, :show, :edit]
devise_for :users
root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
