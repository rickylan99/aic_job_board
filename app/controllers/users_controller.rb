class UsersController < ApplicationController
  
  def new
    @user = User.new
    @document = @user.documents.build
  end

  def index
    #@users = User.all
  end

  def create
    new 

    access_submission = AccessSubmission.find(params[:id])
    email = access_submission.email
    first_name = access_submission.first_name
    last_name = access_submission.last_name
    classification = access_submission.classification
    phone_number = access_submission.phone_number
    public_id = access_submission.public_id
    file_name = access_submission.file_name
    documenttype = access_submission.documenttype

    
    
    @user = User.create(password: "password",password_confirmation: "password",email: email, first_name: first_name, \
      last_name: last_name, classification: classification,phone_number: phone_number, role_id: 1)

    doc = @user.documents.new(public_id: public_id, file_name: file_name, documenttype: 'resume')
    doc.save

    if @user
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      access_submission.destroy
      redirect_to root_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash[:alert] = "Failed to create User"
      redirect_to root_path
    end


    
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

  def update
    @user = current_user
    if params[:documents]
      params[:documents].each do |doc|
        cloud_output = Cloudinary::Uploader.upload(doc, :type => :private)
        public_id = cloud_output["public_id"]
        file_name = cloud_output["original_filename"]
        doc = @user.documents.new(public_id: public_id, file_name: file_name ,documenttype: 'resume')
        doc.save
        # Cloudinary::Utils.private_download_url(user.documents[0].file, :pdf)
      end
    end
    byebug
    if !user_params.nil?
      if @user.update(user_params)
        redirect_to(edit_user_path)
      end
    else
      render('edit')
    end
  end

  def edit
    @user = User.find(params[:id])
    @document = @user.documents.build
  end

  private
  def user_params
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:name, :email, :first_name, :last_name, :major, :password, :password_confirmation)
  end

end
