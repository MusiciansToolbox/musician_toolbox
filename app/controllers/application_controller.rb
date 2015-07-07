class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
      :name,
      :email,
      :zipcode,
      :description,
      :password,
      :password_confirmation,
      :current_password,
      :instruments_attributes => [ :name, :user_id, :id],
      :genres_attributes => [ :name, :user_id, :id],
      :influences_attributes => [ :name, :user_id, :id])
    }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
      :name,
      :email,
      :zipcode,
      :description,
      :password,
      :password_confirmation,
      :current_password,
      :instruments_attributes => [ :name, :user_id, :id],
      :genres_attributes => [ :name, :user_id, :id],
      :influences_attributes => [ :name, :user_id, :id])
    }
  end

end
