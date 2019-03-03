Rails.application.routes.draw do

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  resources :user_sessions
  resources :users

	resources :bugs do	
		resources :comments
	end
  root :to => 'bugs#index'
end
