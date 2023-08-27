Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:show]

  root 'statics#index'

  # devination rune
  get "/devination_rune", to: "nordic_rune#index"
  post "/devination_rune", to: "nordic_rune#devination_result",  as: :devination_rune_result

  # scout
  get  "/scount/new", to: "scouts#new", as: :new_scout

end
