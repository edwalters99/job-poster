Rails.application.routes.draw do

  root :to => 'pages#home'
  
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  
  resources :users
  resources :jobs
  
  get '/:id/jobs' => 'jobs#index_my', :as => 'my_jobs'
end
