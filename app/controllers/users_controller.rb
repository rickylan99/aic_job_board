class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    #@users = User.all
    
  end

  def create
    @user = User.new(user_params)
    # Setting roleid to 1 (Regular User) for now
    @user.role_id = 1

    # Store all emails in lowercase
    @user.email.downcase!
    
    if @user.save
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Ensure valid email and password and try again."
      render :new
    end
  end
  
  def show
   # @user = User.find(params[:id])
  end

  private

  def user_params
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:name, :email, :first_name, :last_name, :password, :password_confirmation)
  end

end
