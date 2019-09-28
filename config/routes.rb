Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:index, :show]

  root to: "tasks#index"
  resources :tasks, shallow: true do
    collection do
      get 'list'
    end
    resources :comments
  end
  resources :tags
  resources :points
  resources :task_favorites, only: [:create, :destroy]
  resources :contact, only:[:new, :create]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
