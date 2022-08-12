Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  get "home/about" => "home#about" , as: "about"
  get "books/:id" => "books#show", as: "book"
  get "books/:id/book_comments" => "books#show"

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :book_comments, only: [:create, :destroy]
  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
