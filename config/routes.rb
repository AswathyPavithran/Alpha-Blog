Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'welcome/about' ,to:'welcome#about'

  resources :articles

  get 'signup' ,to:'users#new'
  #post 'users' ,to:'users#create'
  get 'login' ,to:'sessions#new'
  post 'login' ,to:'sessions#create'
  delete 'logout' ,to:'sessions#destroy' 
  resources :users,except: [:new]

  resources :categories ,except: [:destroy]
end
