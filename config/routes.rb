Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
