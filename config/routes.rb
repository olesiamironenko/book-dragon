Rails.application.routes.draw do
  resources :reading_lists
  resources :genres
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: "books#index"

  resources :users

  resources :genres

  resources :authors do
    get 'books', to: 'authors#books', as: 'author_books'
  end

  resources :books do
    post 'add_to_reading_list', on: :member
  end
  
  resources :book_author_relation

  resources :reading_lists do
    post 'add_book', on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
