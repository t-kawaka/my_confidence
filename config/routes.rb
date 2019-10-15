Rails.application.routes.draw do
  root to: 'tops#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, :only => [:index, :show]
  get '/my_confidence', to: 'tops#index'

  resources :tasks do
    collection do
      get 'list'
      get 'record'
    end
    resources :comments, only: %i[edit create update destroy]
  end

  resources :tags
  resources :points
  resources :task_favorites, only: %i[create destroy]
  resources :contacts, only: %i[new create] do
    post :confirm, on: :new
  end
  resources :relationships, only: %i[create destroy]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
