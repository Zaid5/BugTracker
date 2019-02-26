Rails.application.routes.draw do
resources :bugs do
    member do
      get :toggle_status
    end
  end
end
