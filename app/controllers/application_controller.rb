class ApplicationController < ActionController::Base
  protect_from_forgery
  include Pundit::Authorization
  include Pagy::Backend
  add_flash_types :success, :info, :warning, :danger
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :set_search_instance

  private

  def user_not_authorized
    flash[:alert] = 'ページが見つかりません'
    redirect_back(fallback_location: whiskeys_path)
  end

  def set_search_instance
    @q = Whiskey.ransack(params[:q])
  end
end
