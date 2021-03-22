Rails.application.routes.draw do
  
  resources :access_submissions
 

  get 'static_page/about'
  get 'static_page/resources'
  resources :jobs do 
    resources :job_applications
  end

  #TODO: Figure out the routings for the document endpoints
  resources :documents, only: [:destroy]

  #TODO: Figure out what to do with these role routes, I do not think are necessary just seed DB
  get 'roles/index'
  get 'roles/create'
  get 'roles/show'
  get 'roles/edit'
  get 'roles/delete'

<<<<<<< HEAD
=======
  #TODO: Figure out what to do with these user routes, could be combined with the previous admin routes and student routes into just "User" routes
  get 'users/index'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/delete'
  
  get 'students/create'
  get 'students/index'
  # Authentication Routes
  	
>>>>>>> development
  # Sign up page with form:
	get 'users/new' => 'users#new', as: :new_user
	# Create action for when sign up form is submitted:
	post 'users' => 'users#create'
<<<<<<< HEAD
=======

  get 'users/edit' => 'users#edit', as: :edit_user

  patch 'users/edit' => 'users#update'

>>>>>>> development
  # Log in page with form:
	get '/login'     => 'sessions#new',  as: :login
	# Create action for when log in form is submitted:
	post '/login'    => 'sessions#create'
	# Delete action to log out:
	get '/logout' => 'sessions#destroy', as: :logout
  patch '/users/:id/edit', to: 'users#edit'
  resources :users 


  get "users/:id", to: 'users#create', as: :accepted_user

  root to: 'sessions#new'

end
