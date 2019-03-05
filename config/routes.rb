Rails.application.routes.draw do
  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

	resources :bugs do	
		resources :comments
	end
  root :to => 'users#index'

  match "*path", to: "bugs#catch_404", via: :all

end
