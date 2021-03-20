Rails.application.routes.draw do

  get 'static_page/about'
  get 'static_page/resources'
  resources :jobs do 
    resources :job_applications
  end

  #TODO: Figure out the routings for the document endpoints
  get 'documents/index'
  get 'documents/create'
  get 'documents/show'
  get 'documents/edit'
  get 'documents/delete'

  #TODO: Figure out what to do with these role routes, I do not think are necessary just seed DB
  get 'roles/index'
  get 'roles/create'
  get 'roles/show'
  get 'roles/edit'
  get 'roles/delete'

  #TODO: Figure out what to do with these user routes, could be combined with the previous admin routes and student routes into just "User" routes
  get 'users/index'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/delete'
  
  # Authentication Routes
  	
  # Sign up page with form:
	get 'users/new' => 'users#new', as: :new_user
	
	# Create action for when sign up form is submitted:
	post 'users' => 'users#create'

  # Log in page with form:
	get '/login'     => 'sessions#new',  as: :login
	
	# Create action for when log in form is submitted:
	post '/login'    => 'sessions#create'
	
	# Delete action to log out:
	get '/logout' => 'sessions#destroy', as: :logout

  root to: 'sessions#new'

end
