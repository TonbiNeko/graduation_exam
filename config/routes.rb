Rails.application.routes.draw do
  devise_for :places, controllers: { registrations: 'places/registrations',
                                    sessions: 'places/sessions',
                                    passwords:     'places/passwords' }
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    passwords: 'users/passwords'}
  resources :users
  root 'blogs#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
