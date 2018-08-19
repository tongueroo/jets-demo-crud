Jets.application.routes.draw do
  resources :posts
  # Default homepage. This should be replaced.
  root "jets/welcome#index"

  # Required for API Gateway to serve static utf8 content out of public folder.
  # Replace with your own controller to customize.
  any "*catchall", to: "jets/public#show"
end
