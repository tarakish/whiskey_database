class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new login_as]

  def new; end

  # def create
  #   @user = login(params[:email], params[:password])

  #   if @user
  #     redirect_back_or_to(:users, notice: 'ログインしました')
  #   else
  #     flash.now[:alert] = 'ログインできませんでした'
  #     render action: 'new'
  #   end
  # end

  def destroy
    logout
    redirect_to(root_path, notice: 'ログアウトしました')
  end

  def login_as
    user = User.find(params[:user_id])
    auto_login(user)
    redirect_to root_path, success: "#{Rails.env}環境でログインしました"
  end
end
