Rails.application.routes.draw do
  devise_for :users
  root to: "tasks#index"
  resources :tasks
  resources :points

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
