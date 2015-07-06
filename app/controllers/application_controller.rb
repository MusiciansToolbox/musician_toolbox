class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # private def user_logged_in?
  #   unless User.find_by_id(current_user.id)
  #     redirect_to user_session_path, notice: 'Please login to view this page.'
  #   end
  # end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:type, :email, :password) }
  end


end
