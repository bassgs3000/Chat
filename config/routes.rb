Chat::Application.routes.draw do
  devise_for :users
  
  match "lobby" => "lobby#index", via: [:get]
  match "chatroom/new" => "lobby#new", as: "new_chatroom", via: [:get]
  match "chatroom/create" => "lobby#create", as: "create_chatroom", via: [:post]
  match "messages" => "messages#index", via: [:get]
  match "messages" => "messages#create", via: [:post]

  root to: "messages#index"
end
