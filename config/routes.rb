Rails.application.routes.draw do

  root 'home#top'
  get "home/about" => "home#about"

  # post   '/like/:book_id' => 'likes#like',   as: 'like'
  # delete '/like/:book_id' => 'likes#unlike', as: 'unlike'

  devise_for :users
  resources :books, only: [:new,:create,:index,:show,:destroy,:edit,:update] do
  resource :post_comments, only: [:create]
 end
 resources :post_comments, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
