class ApplicationController < ActionController::Base
  protected

  def current_user
    super&.decorate
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User) && resource.admin?
        dashboards_path
      else
        root_path
      end
  end
end
