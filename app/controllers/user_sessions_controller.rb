class UserSessionsController < ApplicationController
  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(:users, notice: 'ログインしました')
    else
      flash.now[:alert] = 'ログインできませんでした'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end

  def login_as
    user = User.find(params[:user_id])
    auto_login(user)
    redirect_to root_path, notice: "#{Rails.env}環境でログインしました"
  end
end
