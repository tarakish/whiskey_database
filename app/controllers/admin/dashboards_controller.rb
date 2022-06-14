class Admin::DashboardsController < Admin::BaseController
  def top
    authorize :application, :index?
  end
end
