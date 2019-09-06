Rails.application.routes.draw do
  root to: "actions#index"
  resources :actions
end
