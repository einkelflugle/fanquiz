Rails.application.routes.draw do
    devise_for :users
    resources :users
    resources :quizzes do
    	member do
    		get 'enter'
    		post 'submit_entry'
    	end
    end
    root to: 'quizzes#index'
end
