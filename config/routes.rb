Rails.application.routes.draw do
  get 'comments/create'
  devise_for :places, controllers: { registrations: 'places/registrations',
                                    sessions: 'places/sessions',
                                    passwords:     'places/passwords' }
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    passwords: 'users/passwords'}
  resources :users, only: [:index, :show] do
    member do
      get :user_blogs
    end
  end
  resources :places, only: [:index, :show] do
    collection do
      get 'search'
    end
  end
  resources :favorites, only: [:create, :destroy]
  root 'blogs#index'
  resources :blogs do
    collection do
      post :confirm
    end
    resources :comments
  end
end
