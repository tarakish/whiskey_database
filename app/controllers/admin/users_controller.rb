class Admin::UsersController < Admin::BaseController
  before_action :authorize_user
  before_action :set_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, success: '作成しました！'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_url, success: '更新しました！'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_url, danger: '削除しました！'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    authorize User, policy_class: ApplicationPolicy
  end

  def user_params
    params.require(:user).permit(
      :name,
      :best_bottle,
      :avatar,
      :avatar_cache
    )
  end
end
