class Admin::SnacksController < Admin::BaseController
  before_action :authorize_user
  before_action :set_snack, only: %i[edit update destroy]

  def index
    @snacks = Snack.order(:id)
  end

  def new
    @snack = Snack.new
  end

  def edit; end

  def create
    @snack = Snack.new(snack_params)

    if @snack.save
      redirect_to admin_snack_url, success: '作成しました！'
    else
      render :new
    end
  end

  def update
    if @snack.update(snack_params)
      redirect_to admin_snacks_url, success: '更新しました！'
    else
      render :edit
    end
  end

  def destroy
    @snack.destroy!
    redirect_to admin_snacks_url, danger: '削除しました！'
  end

  private

  def set_snack
    @snack = Snack.find(params[:id])
  end

  def authorize_user
    authorize Snack, policy_class: ApplicationPolicy
  end

  def snack_params
    params.require(:snack).permit(
      :name,
      :english_name,
      :description,
      :image
    )
  end
end
