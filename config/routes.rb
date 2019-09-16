Rails.application.routes.draw do
  root to: "tasks#index"
  resources :tasks
  resources :points

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
