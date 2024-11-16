Rails.application.routes.draw do
  resources :chats do
    resources :messages, only: [:create]
  end
  root 'chats#index'
end