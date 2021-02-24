class SessionsController < ApplicationController

    def new
        # If user logged in already redirect to jobs/show
        if !current_user.nil?
            redirect_to jobs_path
        end

    end
    
    def create
    # Find email in DB by lowercase
    user = User.find_by(email: params[:login][:email].downcase)
    
    # Verify user exists in db and run has_secure_password's .authenticate() 
    if user && user.authenticate(params[:login][:password]) 
        # Save the user.id in that user's session cookie:
        session[:user_id] = user.id.to_s
        redirect_to jobs_path, notice: 'Successfully logged in!'
    else
        # if email or password incorrect, re-render login page:
        flash.now.alert = "Incorrect email or password, try again."
        render :new
    end
    end

    def destroy
        # delete the saved user_id key/value from the cookie:
        session.delete(:user_id)
        redirect_to login_path, notice: "Logged out!"
    end
  
  end