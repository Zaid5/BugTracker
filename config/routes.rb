Rails.application.routes.draw do

  root :to => 'bugs#index'
  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

	resources :bugs do	
		resources :comments
	end
end
