class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :devise_parameter_sanitizer, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :address, :description])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :address, :description])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :image, :address, :description])
  end

  # def devise_parameter_sanitizer
  #   if resource_class == Place
  #     Place::ParameterSanitizer.new(Place, :user, params)
  #   else
  #     super # Use the default one
  #   end
  # end
end