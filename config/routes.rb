Rails.application.routes.draw do
  get 'comments/create'
  devise_for :places, controllers: { registrations: 'places/registrations',
                                    sessions: 'places/sessions',
                                    passwords:     'places/passwords' }
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    passwords: 'users/passwords'}
  resources :users, only: [:index, :show]
  resources :places, only: [:index, :show]
  resources :favorites, only: [:create, :destroy]
  root 'blogs#index'
  resources :blogs do
    collection do
      post :confirm
    end
    resources :comments
  end
end
