PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  resources :categories, only: [:new, :create, :show, :index]
  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end
end
