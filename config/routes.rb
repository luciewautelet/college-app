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
  get '/homele' => 'lecturer#home'
  
  get '/dellect' => 'course_module#deluser'
  get '/assign' => 'course_module#assign'
  get '/assget' => 'course_module#assget'
  
  get 'addgrade' => 'grade#add'
  get 'modgrade' => 'grade#modify'
  
  post '/grades' => 'grade#addget'
  post '/modget' => 'grade#modget'
  
  get 'subscribe' => 'student#subscribe'
  get 'insuscribe' => 'student#insuscribe'

  root 'sessions#new'
  
  resources :students 
  resources :lecturers
  resources :admins
  resources :grades
  
end