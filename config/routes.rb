Rails.application.routes.draw do

  root 'statics#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # devination rune
  get "/devination_rune", to: "nordic_rune#index"
  post "/devination_rune", to: "nordic_rune#devination_result",  as: :devination_rune_result

end
