class Admin::FlavorsController < Admin::BaseController
  before_action :authorize_user
  before_action :set_flavor, only: %i[edit update destroy]

  def index
    @flavors = Flavor.order(:id)
  end

  def new
    @flavor = Flavor.new
  end

  def edit; end

  def create
    @flavor = Flavor.new(flavor_params)
    if @flavor.save
      redirect_to admin_flavors_url, success: '作成しました！'
    else
      render :new
    end
  end

  def update
    if @flavor.update(flavor_params)
      redirect_to admin_flavors_url, success: '更新しました！'
    else
      render :edit
    end
  end

  def destroy
    @flavor.destroy!
    redirect_to admin_flavors_url, danger: '削除しました！'
  end

  private

  def set_flavor
    @flavor = Flavor.find(params[:id])
  end

  def authorize_user
    authorize Flavor, policy_class: ApplicationPolicy
  end

  def flavor_params
    params.require(:flavor).permit(
      :name,
      :detail,
      :group
    )
  end
end
