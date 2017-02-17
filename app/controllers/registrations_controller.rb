class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected
  def configure_permitted_parameters
    puts 'hello world!!!!!!!!!!!!!!!!!!!!'
    devise_parameter_sanitizer.permit(:sign_up, keys: [:organization_id])
  end
end
