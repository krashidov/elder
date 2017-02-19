class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_organization

  def set_organization
    #@organization = if current_user then current_user.organization else nil
    @organization_params = {organization_id:  Organization.first.id}
  end
end
