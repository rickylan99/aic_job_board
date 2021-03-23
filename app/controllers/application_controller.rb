class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :is_admin

  def current_user
    # Look up the current user based on user_id in the session cookie:
    # ||= caches current_user to prevent repeated DB lookups
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin
    return current_user.role_id == Role.find_by_roletype("Admin").id
  end

  # Add before_action :authorize to beginning of controller to prevent unathorized acess
  def authorize
    redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
  end

  def admin_only
    redirect_to root_path, alert: 'You must be an admin to access this page.' if not current_user.role_id == Role.find_by_roletype("Admin").id
  end

 

end
