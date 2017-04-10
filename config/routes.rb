Rails.application.routes.draw do
  
  get '/new' => 'department#new'
  post '/create' => 'department#create'
  get '/show' => 'department#show'
  
  get '/newp' => 'programme#newp'
  post '/createp' => 'programme#createp'
end