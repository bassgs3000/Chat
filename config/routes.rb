Chat::Application.routes.draw do
  devise_for :users

  match "messages" => "messages#index", via: [:get]
  match "messages" => "messages#create", via: [:post]

  root to: "messages#index"
end
