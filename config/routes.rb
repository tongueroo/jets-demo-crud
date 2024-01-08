Jets.application.routes.draw do
  root "home#index"
  resources :posts
  any "*catchall", to: "jets/public#show"
end
