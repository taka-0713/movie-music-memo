Rails.application.routes.draw do
  devise_for :users

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end

  root to: 'memos#index'

  resources :memos, except: [:index] do
    collection do
      get 'search'
    end
  end

  resources :users, only: :show

end
