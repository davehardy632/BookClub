Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :show, :new, :create, :destroy] do
    resources :reviews, only: [:new, :create, :destroy]
  end

  resources :authors, only: [:show]

  get '/', to: 'welcome#index', as: 'welcome'

  get '/user/:user', to: 'reviews#user_show', as: 'user'
  get '/user/:user', to: 'reviews#user_show', as: 'user_asc'#, defaults: { user: :user }
  get '/user/:user', to: 'reviews#user_show', as: 'user_desc'
end
