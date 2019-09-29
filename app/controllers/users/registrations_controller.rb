class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :admin, :icon, :remove_icon]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
end
