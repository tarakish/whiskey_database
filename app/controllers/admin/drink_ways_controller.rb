class Admin::DrinkWaysController < Admin::BaseController
  before_action :authorize_user
  before_action :set_drink_way, only: %i[edit update destroy]

  def index
    @drink_ways = DrinkWay.order(:id)
  end

  def new
    @drink_way = DrinkWay.new
  end

  def edit; end

  def create
    @drink_way = DrinkWay.new(drink_way_params)
    if @drink_way.save
      redirect_to admin_drink_ways_path, success: '作成しました！'
    else
      render :new
    end
  end

  def update
    if @drink_way.update(drink_way_params)
      redirect_to admin_drink_ways_path, success: '更新しました！'
    else
      render :edit
    end
  end

  def destroy
    @drink_way.destroy!
    redirect_to admin_drink_ways_url, notice: '削除しました！'
  end

  private

  def set_drink_way
    @drink_way = DrinkWay.find(params[:id])
  end

  def authorize_user
    authorize DrinkWay, policy_class: ApplicationPolicy
  end

  def drink_way_params
    params.require(:drink_way).permit(
      :name,
      :english_name,
      :how_to_make_url,
      :explanation,
      :image
    )
  end
end
