Rails.application.routes.draw do

  resources :password_forgets

  delete 'access_submissions/:id', to: 'access_submissions#destroy', as: :access_submissions_destroy
  resources :access_submissions
 

  get 'static_page/about'
  get 'static_page/resources'
  get 'static_page/help_user'
  get 'static_page/help_user'
  get 'static_page/help_firm'
  get 'static_page/help_job'
  resources :jobs do 
    resources :job_applications
  end

  resources :firms do
    member do
      get 'jobs'
      get 'new_job'
    end
    collection do
      post 'create_job'
    end
  end

  resources :logos do
    get "serve", :on => :member
  end
  
  #TODO: Figure out the routings for the document endpoints
  delete 'documents/:id', to: 'documents#destroy', as: :documents_delete
  resources :documents

  #TODO: Figure out what to do with these role routes, I do not think are necessary just seed DB
  get 'roles/index'
  get 'roles/create'
  get 'roles/show'
  get 'roles/edit'
  get 'roles/delete'

  get 'admins/index'
  get 'admins/users_panel', as: :users_panel
  get 'admins/jobs_panel', as: :jobs_panel
  get 'admins/firms_panel', as: :firms_panel
  get 'admins/firm_view/:id' => 'admins#firm_view', as: :firm_view
  get 'admins/job_view/:id' => 'admins#job_view', as: :job_view

  #TODO: Figure out what to do with these user routes, could be combined with the previous admin routes and student routes into just "User" routes
  get 'users/index'
  get 'users/create'
  get 'users/edit'
  get 'users/delete'
  get 'users/promote'
  
  # Authentication Routes

  # Export job
	get 'export/job/:id' => 'export#export_job', as: :export_job

  get 'export/users' => 'export#export_users', as: :export_users
  	
  # Sign up page with form:
	get 'users/new' => 'users#new', as: :new_user
	
	# Create action for when sign up form is submitted:
	post 'users' => 'users#create'

  get 'users/my_profile' => 'users#edit', as: :edit_user

  patch 'users/my_profile' => 'users#update'

  get 'users/show/:id' => 'users#show', as: :user_show

  delete 'users/delete/:id' => 'users#destroy', as: :user_delete

  post 'users/promote/:id' => 'users#promote', as: :user_promote

  post 'users/demote/:id' => 'users#demote', as: :user_demote

  # Log in page with form:
	get '/login'     => 'sessions#new',  as: :login
	
	# Create action for when log in form is submitted:
	post '/login'    => 'sessions#create'
	
	# Delete action to log out:
	get '/logout' => 'sessions#destroy', as: :logout



  get "users/:id", to: 'users#create', as: :accepted_user

  root to: 'sessions#new'

end
