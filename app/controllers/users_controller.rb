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
    major = access_submission.major
    phone_number = access_submission.phone_number
    public_id = access_submission.public_id
    file_name = access_submission.file_name
    investment_banking = access_submission.investment_banking
    private_equity = access_submission.private_equity
    venture_capital = access_submission.venture_capital
    real_estate = access_submission.real_estate
    role_id = Role.find_by(roletype: 'Student').id

    charset = Array('A'..'Z') + Array('a'..'z')
    passwd = Array.new(15) { charset.sample }.join

    @user = User.create(password: passwd, password_confirmation: passwd, email: email,
                        first_name: first_name, last_name: last_name,
                        classification: classification, major: major,
                        phone_number: phone_number, investment_banking: investment_banking,
                        private_equity: private_equity, venture_capital: venture_capital,
                        real_estate: real_estate, role_id: role_id)

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
    redirect_to users_panel_path
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

    @readonly_email = true
    @readonly_password = false
    @readonly_classification = false
    @readonly_major = false
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_panel_path
  end

  def promote
    @user = User.find(params[:id])
    role_id = Role.find_by(roletype: 'Admin').id
    @user.update(role_id: role_id)
    redirect_to users_panel_path
  end

  def demote
    @user = User.find(params[:id])
    role_id = Role.find_by(roletype: 'Student').id
    @user.update(role_id: role_id)
    redirect_to users_panel_path
  end

  private

  def user_params
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:name, :email, :first_name, :last_name, :major, :password, :classification,
                                 :password_confirmation, :investment_banking, :private_equity,
                                 :venture_capital, :real_estate)
  end
end
