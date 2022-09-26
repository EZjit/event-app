Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: 'events#index'
  resources :events do
    post '/attend', to: 'events#attend', as: 'attend'
  end

  get 'users/id' => 'users#show', as: 'profile'

  resources :attends, only: %i[create destroy]


end
