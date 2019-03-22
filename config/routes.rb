Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end

  get '/', to: 'welcome#index', as: 'welcome'
  get '/user/:user', to: 'reviews#user', as: 'user'

end
