Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  get 'calendar', to: 'diaries#calendar'
  get 'doctor_home', to: 'pages#doctor_home'

  resources :diaries, only: [:edit, :update, :index] do
    resources :moods, only: [:index, :update, :create, :destroy]
    resources :contents, only: :update
    resources :diaries_rewards, only: %i[new create]
  end
  resources :users, only: [:show, :edit]
  resources :user_categories, only: [:create, :destroy]
  resources :patients, only: [:index, :show]
end
