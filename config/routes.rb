Rails.application.routes.draw do
  get 'job_applications/index'
  get 'job_applications/create'
  get 'job_applications/show'
  get 'job_applications/edit'
  get 'job_applications/delete'
  get 'jobs/index'
  get 'jobs/create'
  get 'jobs/show'
  get 'jobs/edit'
  get 'jobs/delete'
  get 'resumes/index'
  get 'resumes/create'
  get 'resumes/show'
  get 'resumes/edit'
  get 'resumes/delete'
  get 'admins/index'
  get 'admins/create'
  get 'admins/show'
  get 'admins/edit'
  get 'admins/delete'
  get 'students/index'
  get 'students/create'
  get 'students/show'
  get 'students/edit'
  get 'students/delete'
  get 'roles/index'
  get 'roles/create'
  get 'roles/show'
  get 'roles/edit'
  get 'roles/delete'
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
