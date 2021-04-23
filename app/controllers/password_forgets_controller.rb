# frozen_string_literal: true

class PasswordForgetsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.present?
      user&.send_password_forget
      flash[:notice] = 'Email sent with password reset instructions. Please check your Spam folder as well'
      redirect_to root_path
    else
      flash[:alert] = 'Check Email is valid and try again.'
      redirect_to new_password_forget_path
    end
    
  end

  def edit
    @user = User.find_by!(password_reset_token: params[:id])
  end

  def update
    @user = User.find_by!(password_reset_token: params[:id])
    if @user.password_reset_sent_at < 1.day.ago
      flash[:notice] = 'Password reset has expired'
      redirect_to new_password_forget_path
    elsif @user.update(user_params)
      flash[:notice] = 'Password has been reset!'
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:password)
  end
end
