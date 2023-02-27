Rails.application.routes.draw do
  get 'welcome/show'
  devise_for :users

  resources :projects do
    resources :comments
  end

  resource :welcome, only: %i[show]

  root 'welcome#show'

  get '/user', to: 'projects#index', as: :user_root
end
