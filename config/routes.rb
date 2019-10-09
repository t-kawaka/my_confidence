Rails.application.routes.draw do
  root to: 'tasks#index'
  devise_for :users, :controller => {
    :resigtrations  => 'users/registrations'
  }
  resources :users, :only => [:index, :show]
  get '/my_confidence', to: 'tops#index'

  resources :tasks, shallow: true do
    collection do
      get 'list'
    end
    resources :comments
  end
  
  resources :tags
  resources :points
  resources :task_favorites, only: %i[create destroy]
  resources :contacts do
    post :confirm, on: :new
  end
  resources :relationships, only: %i[create destroy]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
