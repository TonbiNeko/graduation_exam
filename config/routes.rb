Rails.application.routes.draw do
  # resources :users
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions'}
  resources :users
  root 'blogs#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
