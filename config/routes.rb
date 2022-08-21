Rails.application.routes.draw do
  resources :articles
  root "dashboard#show"
end
