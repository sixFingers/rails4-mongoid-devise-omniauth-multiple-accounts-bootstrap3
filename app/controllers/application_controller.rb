class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    @user = User.find(resource._id)
    session[:user_id] = @user.id
    stored_location_for(resource) || signed_in_root_path(resource)
  end

  def current_user
    @current_user ||= (session[:user_id].present? ? User.find(session[:user_id]): nil)
  end

  def signed_in?
    !!current_user
  end
  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? user : user.id
  end
end
