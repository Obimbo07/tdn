<<<<<<< HEAD
=======
# frozen_string_literal: true

# This controller provides common functionality for all other controllers
>>>>>>> dcecf69b30970763751a1e57ac85f15bdcac83e5
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation bio])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_updates, keys: %i[name email password password_confirmation bio])
  end
end
