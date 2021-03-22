class UsersController < ApplicationController
  
  def new
    @user = User.new
    @document = @user.documents.build
  end

  def index
    #@users = User.all
    
  end

  def create
    access_submission = AccessSubmission.find(params[:id])
    email = access_submission.email
    first_name = access_submission.first_name
    last_name = access_submission.last_name
    classification = access_submission.classification
    phone_number = access_submission.phone_number
    
    #User.documents.create(file: file, public_id: public_id)
    @user = User.new(password: "password",password_confirmation: "password",email: email, first_name: first_name,last_name: last_name,classification: classification,phone_number: phone_number,role_id: 1)
    if @user.save
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Failed to create User"
    end
    redirect_to root_path
    # # Setting roleid to 1 (Regular User) for now
    # @user.role_id = 1

    # # Store all emails in lowercase
    # @user.email.downcase!
    
    # if @user.save
    #   # If user saves in the db successfully:
    #   flash[:notice] = "Account created successfully!"
    #   redirect_to root_path
    # else
    #   # If user fails model validation - probably a bad password or duplicate email:
    #   flash.now.alert = "Ensure valid email and password and try again."
    #   render :new
    #end
  end
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to(edit_user_path)
    else
      render('edit')
    end
  end

  def edit
    @user = User.find(params[:id])
    @document = @user.documents.build
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      if params[:documents]
        params[:documents].each do |doc|
          public_id = Cloudinary::Uploader.upload(doc, :type => :private)["public_id"]
          doc = @user.documents.new(file: public_id, documenttype: 'resume')
          doc.save
          # Cloudinary::Utils.private_download_url(user.documents[0].file, :pdf)
        end
      end
      
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:name, :email, :first_name, :last_name, :major, :password, :password_confirmation, :document)
  end

end
