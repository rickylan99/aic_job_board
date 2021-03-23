# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
    @document = @user.documents.build
  end

  def index
    @user = User.all
  end

  def create
    new

    access_submission = AccessSubmission.find(params[:id])
    email = access_submission.email.downcase
    first_name = access_submission.first_name
    last_name = access_submission.last_name
    classification = access_submission.classification
    phone_number = access_submission.phone_number
    public_id = access_submission.public_id
    file_name = access_submission.file_name
    role_id = Role.find_by(roletype: 'Student').id

    @user = User.create(password: 'password', password_confirmation: 'password', email: email,
                        first_name: first_name, last_name: last_name,
                        classification: classification,
                        phone_number: phone_number, role_id: role_id)

    doc = @user.documents.new(public_id: public_id, file_name: file_name, documenttype: 'resume')
    doc.save

    if @user
      # If user saves in the db successfully:
      flash[:notice] = 'Account created successfully!'
      access_submission.destroy
      @user.send_password_reset
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash[:alert] = 'Failed to create User'
    end
    redirect_to admins_index_path
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    params[:documents]&.each do |doc|
      cloud_output = Cloudinary::Uploader.upload(doc, type: :private)
      public_id = cloud_output['public_id']
      file_name = cloud_output['original_filename']
      doc = @user.documents.new(public_id: public_id, file_name: file_name,
                                documenttype: 'resume')
      doc.save
      # Cloudinary::Utils.private_download_url(user.documents[0].file, :pdf)
    end
    if !user_params.nil?
      redirect_to(edit_user_path) if @user.update(user_params)
    else
      flash[:alert] = 'Failed to update User'
      render('edit')
    end
  end

  def edit
    @user = current_user
    @document = @user.documents.build
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def user_params
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:name, :email, :first_name, :last_name, :major, :password,
                                 :password_confirmation)
  end
end
