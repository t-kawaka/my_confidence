Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users, :controller => {
    :resigtrations  => 'users/registrations'
  }
  resources :users, :only => [:index, :show]

  root to: 'tasks#index'
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

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
