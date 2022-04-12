Rails.application.routes.draw do

  root :to => 'pages#home'
  
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  
  resources :users
  resources :jobs
  resources :comments, :only => [:create, :edit, :update, :destroy]
  
  get '/jobs/:id/comments/new' => 'comments#new', :as => 'new_comment'
  
  get '/:id/jobs' => 'jobs#index_my', :as => 'my_jobs'

  post '/jobs/:id/assign' => 'jobs#assign', :as => 'assign_job'  
  
  get '/users/:id/changepassword' => 'users#edit_password', :as => 'edit_user_password'

end
