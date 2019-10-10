class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    tasks_path
  end

  def after_sign_out_path_for(resource)
    my_confidence_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :admin, :icon, :remove_icon, :status, :introduce]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
