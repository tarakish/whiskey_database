class ApplicationController < ActionController::Base
  include Pundit::Authorization
  protect_from_forgery
  add_flash_types :success, :info, :warning, :danger
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back(fallback_location: whiskeys_path)
  end
end
