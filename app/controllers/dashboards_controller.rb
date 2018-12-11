class DashboardsController < ApplicationController
  before_action :authorize_admin

  def index
    @clients_count = User.where(role: [nil, ""], admin: false).count
    render layout: false
  end

  private

  def authorize_admin
    redirect_to root_path unless current_user.admin?
  end
end
