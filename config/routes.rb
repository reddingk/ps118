Rails.application.routes.draw do
  get 'jada/index'

  get 'sfiles/new'

  post 'sfiles/create'

  get 'sfiles/destroy'

  get 'devices/new'

  get 'sessions/new'

  get 'user_manag/index'

#Gerald
  root 'gerald#index'

  get 'gerald/arnold'

  get 'gerald/sid'

  get 'gerald/construction'
#Brainy
  get 'brainy/index'

  get 'brainy/eugene'
  resources :sfiles
  
  get 'brainy/download' 
  resources :sfiles
  
  get 'brainy/view' 
  resources :sfiles
  
#User Managament
  get 'UserManagement'  => 'users#index'
  get 'users/new'
  get 'users/edit' 
  
#Sessions
  get    'login' => 'sessions#new'
  post   'login' => 'sessions#create'
  get    'logout' => 'sessions#destroy'
  resources :users
  
#Devices
  get 'adduserdevice' => 'devices#new'
  resources :devices

#Sfiles

  #get "/private/uploads/sfile/syncefile/:userid/:sfile", :controller => "brainy", :action => "download"
  get "/private/uploads/sfile/syncefile/:userid/:sfile" => 'brainy#download'
  resources :sfiles
  
#Jada
  get 'jada-voice' => 'jada/index'
 
  
end
