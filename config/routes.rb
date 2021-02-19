Rails.application.routes.draw do

  #Param: id is the user id to show all of their applications
  #get 'job_applications/index/:id', to: 'job_applications#index', as: 'job_applications'
  get 'job_applications/index', to: 'job_applications#index', as: 'job_applications'

  #Param: id is the job id that the application is being filled for 
  get 'job_applications/new/:id', to: 'job_applications#new', as: 'create_job_application'
  #TODO: Add url endpoint for saving the applications

  #Param: id is the job_application id that is being showed
  get 'job_applications/show/:id', to: 'job_applications#show', as: 'job_application_details'

  #Param: id is the job_application id that is being edited
  get 'job_applications/edit/:id', to: 'job_applications#edit'

  #Param: id is the id of the application that needs to be deleted
  get 'job_applications/delete', to: 'job_applications#delete'

  #No param, will display to all users the job applications available
  get 'jobs/index', to: 'jobs#index', as: 'jobs'
  #TODO: Create seperate job display for admins to see their own jobs maybe

  #No param, will be the form the admin uses to create the new job postings
  get 'jobs/new', to: 'jobs#new', as: 'create_job'

  #Param: id is the job id of the job we are showing, will have button "Apply" for users and buttons "Edit" and "Delete" for Admins, maybe "Export Applications"
  get 'jobs/show/:id', to: 'jobs#show', as: 'job_details'

  #Param: id is the job id for the job posting that is being edited, page should only be available to admins
  get 'jobs/edit/:id', to: 'jobs#edit'

  #Param: id is the job id of the job posting being deleted, should be only able to do for admins
  get 'jobs/delete/:id', to: 'jobs#delete'

  #TODO: Figure out the routings for the resume endpoints
  get 'resumes/index'
  get 'resumes/create'
  get 'resumes/show'
  get 'resumes/edit'
  get 'resumes/delete'

  #No params: Will show all admin users, only available to admins
  get 'admins/index'

  #No params, will from to create new Admin users by other Admin users
  get 'admins/create'

  #TODO: Decide if we need to really use these two admin routes
  get 'admins/show'
  get 'admins/edit'

  #Param: id is the id of the Admin user that might get deleted
  get 'admins/delete/:id', to: 'admins#delete'
  #TODO: Figure out if this is necessary

  #TODO: Figure out what todo with these student routes
  get 'students/index'
  get 'students/create'
  get 'students/show'
  get 'students/edit'
  get 'students/delete'

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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
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
