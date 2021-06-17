Rails.application.routes.draw do
  root to: "topics#index"
  resources :topics, onry: :index
end
