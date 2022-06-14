class Admin::WhiskeysController < Admin::BaseController
  before_action :set_whiskey, only: %i[show edit update destroy]

  def index
    @pagy, @whiskeys = pagy(Whiskey.order(:id))
  end

  def show; end

  def new
    @whiskey = Whiskey.new
  end

  def edit; end

  def create
    @whiskey = Whiskey.new(whiskey_params)
    if @whiskey.save
      redirect_to admin_whiskeys_url, success: '作成しました！'
    else
      render :new
    end
  end

  def update
    if @whiskey.update(whiskey_params)
      redirect_to admin_whiskeys_url, success: '更新しました！'
    else
      render :edit
    end
  end

  def destroy
    @whiskey.destroy!
    redirect_to admin_whiskeys_url, danger: '削除しました！'
  end

  private

  def set_whiskey
    @whiskey = Whiskey.find(params[:id])
  end

  def authorize_whiskey
    authorize Whiskey, policy_class: ApplicationPolicy
  end

  def whiskey_params
    params.require(:whiskey).permit(
      :name,
      :region,
      :processing,
      :mouth_feel,
      :flavor_strength,
      :price,
      :rarity,
      :description,
      :amazon_link,
      :amazon_image_link,
      :amazon_impression_link,
      :drink_way_id,
      :snack_id,
      flavor_ids: []
    )
  end
end
