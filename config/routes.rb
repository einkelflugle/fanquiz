Rails.application.routes.draw do
    devise_for :users
    resources :users
    resources :quizzes
    resources :questions, only: [:new, :create]
    root to: 'users#index'
end
