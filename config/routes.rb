Rails.application.routes.draw do


  get '/new' => 'program#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  get 'signup' => 'student#new'
  get 'signup_le'=> 'lecturer#new' 
  get 'signup_ad' => 'admin#new'
  
  post '/create' => 'program#create'
  get '/show' => 'program#show'
  
  get '/newm' => 'course_module#newm'
  post '/createm' => 'course_module#createm'
  
  get 'denied' => 'static_pages#denied'
  get 'authorized' => 'static_pages#authorized'
  
  post 'students' => 'student#create'
  post 'lecturers' => 'lecturer#create'
  post 'admins' => 'admin#create'
  
  get'/home' => 'static_pages#home'
  get '/homest' => 'student#home'
  get '/homead' => 'admin#home'
  
  get '/dellect' => 'course_module#deluser'
  get '/assign' => 'course_module#assign'
  get '/assget' => 'course_module#assget'
  
  resources :students 
  resources :lecturers
  resources :admins
  
end