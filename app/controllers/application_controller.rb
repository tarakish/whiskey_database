class ApplicationController < ActionController::Base
  protect_from_forgery
  include Pundit::Authorization
  include Pagy::Backend
  add_flash_types :success, :info, :warning, :danger
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :set_search_instance
  before_action :require_login
  before_action :ensure_domain, if: :production?

  def ensure_domain
    return unless /\.herokuapp.com/.match?(request.host)

    port = ":#{request.port}" unless [80, 443].include?(request.port)
    redirect_to "#{request.protocol}malt-mate.jp#{port}#{request.path}", status: :moved_permanently
  end

  def production?
    Rails.env.production?
  end

  private

  def user_not_authorized
    flash[:alert] = 'ページが見つかりません'
    redirect_back(fallback_location: root_path)
  end

  def set_search_instance
    @q = Whiskey.ransack(params[:q])
  end

  def not_authenticated
    redirect_to login_url, danger: 'この機能の利用にはログインが必要です'
  end
end
