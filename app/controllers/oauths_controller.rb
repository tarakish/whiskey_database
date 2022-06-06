class OauthsController < ApplicationController
  skip_before_action :require_login
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]

    if auth_params[:denied].present? || auth_params[:error] == "ACCESS_DENIED"
      redirect_to login_path, warning: 'ログインをキャンセルしました'
      return
    end

    begin
      create_user_from(provider) unless (@user = login_from(provider))
      redirect_to user_path(@user), success: "#{provider.titleize}アカウントでログインしました"
    rescue StandardError
      redirect_to login_path, danger: "#{provider.titleize}アカウントでのログインに失敗しました"
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :denied, :error, :state)
  end

  def create_user_from(provider)
    @user = create_from(provider)
    # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule
    reset_session # protect from session fixation attack
    auto_login(@user)
  end
end
