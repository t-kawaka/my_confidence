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

  resources :points

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
