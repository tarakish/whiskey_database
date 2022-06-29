class ApplicationController < ActionController::Base
  protect_from_forgery
  include Pundit::Authorization
  include Pagy::Backend
  rescue_from Pundit::NotAuthorizedError, with: :render_404
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from StandardError, with: :render_500
  add_flash_types :success, :info, :warning, :danger
  before_action :set_search_instance
  before_action :require_login
  before_action :ensure_domain, if: :production?
  before_action :set_random_whiskey, only: %i[render_404 render_500]

  def ensure_domain
    return unless /\.herokuapp.com/.match?(request.host)

    port = ":#{request.port}" unless [80, 443].include?(request.port)
    redirect_to "#{request.protocol}malt-mate.jp#{port}#{request.path}", status: :moved_permanently
  end

  def production?
    Rails.env.production?
  end

  def render_404
    render template: 'errors/404', status: 404
  end

  def render_500
    render template: 'errors/500', status: 500
  end

  private

  def set_search_instance
    @q = Whiskey.ransack(params[:q])
  end

  def not_authenticated
    redirect_to login_url, danger: 'この機能の利用にはログインが必要です'
  end

  def set_random_whiskey
    @whiskey = Whiskey.where( 'id >= ?', rand(Whiskey.first.id..Whiskey.last.id) ).first
  end
end
