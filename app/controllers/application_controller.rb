class ApplicationController < ActionController::Base
  before_action :devise_parameter_sanitizer, if: :devise_controller?

  protected

  class Place::ParameterSanitizer < Devise::ParameterSanitizer
    def initialize(*)
      super
      permit(:sign_up, keys: [:name, :address, :description, :image])
      permit(:account_update, keys: [:name, :address, :description, :image])
      permit(:sign_in, keys: [:name, :address, :description, :image])
    end
  end

  class User::ParameterSanitizer < Devise::ParameterSanitizer
    def initialize(*)
      super
      permit(:sign_up, keys: [:name, :image])
      permit(:account_update, keys: [:name, :image])
      permit(:sign_in, keys: [:name, :image])
    end
  end

  def devise_parameter_sanitizer
    if resource_class == Place
      Place::ParameterSanitizer.new(Place, :place, params)
    elsif resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super # Use the default one
    end
  end
end