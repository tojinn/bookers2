Rails.application.routes.draw do
  get 'abouts/show'
  root to: 'homes#top'
  devise_for :users
  resources :books
  delete 'book/:id' => 'books#destroy'
  resources :users 
  resources :abouts, only: [:index]
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  get 'home/about' => 'homes#about', as: 'about'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
