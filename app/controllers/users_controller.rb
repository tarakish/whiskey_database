class UsersController < ApplicationController
  skip_before_action :require_login, only: :show
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[index show]
  before_action :authorize_self, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def show
    @tasting_notes = @user.tasting_notes.preload(:whiskey, :drink_way)
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_url(@user), success: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to root_url, notice: '退会しました。ご利用ありがとうございました。'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    authorize User
  end

  def authorize_self
    authorize @user
  end

  def user_params
    params.require(:user).permit(
      :name,
      :best_bottle,
      :role
    )
  end
end
