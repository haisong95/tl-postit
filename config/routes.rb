PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/addjob', to: 'jobs#new'
  post '/addjob', to: 'jobs#new'
  


   resources :users, only:[:show, :create, :edit, :update]
   resources :categories, only: [:new, :create, :show, :index, :edit, :update]
   resources :jobs, only: [:show, :index, :create, :new, :edit, :update]
   resources :posts, except: [:destroy] do
     member do
      post 'vote'
     end

   resources :comments, only: [:create] do
     member do
      post 'vote'
    end
  end
end
end
