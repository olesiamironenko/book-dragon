Rails.application.routes.draw do
  resources :reading_lists
  resources :genres

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/edit_password', to: 'users/registrations#edit_password', as: :edit_password
    put 'users/update_password', to: 'users/registrations#update_password', as: :password_update
  end

  root to: "books#index"

  resources :users, only: [:index, :show]

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
