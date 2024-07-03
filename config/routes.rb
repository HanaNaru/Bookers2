Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "/home/about" => "homes#about"
  resources :users, only: [:index, :show, :edit, :update]
       resources :books do
        resource :favorites, only: [:create, :destroy]
        resource :comments, only: [:create, :destroy]
       end

       resources :users, only: [:index, :show, :create, :update]do
          patch '/:id', to: 'users#update', as: 'update_user'
       end
      delete 'books/:id' ,to: 'book#show', as: 'destroy_book'
end
