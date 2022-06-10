class WhiskeysController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_whiskey, only: %i[show edit update destroy]
  before_action :authorize_whiskey, except: :show

  def index
    result = @q.result(distinct: true).eager_load(:whiskey_flavors, :flavors)
    @pagy, @searched_whiskeys = pagy(result)
  end

  def show
    authorize Whiskey
    @tasting_notes =
      @whiskey.tasting_notes.preload(:user).eager_load(:drink_way, :flavor).order(id: :desc)
    @tasting_note = current_user.tasting_notes.build if current_user
  end

  def new
    @whiskey = Whiskey.new
  end

  def edit; end

  def create
    @whiskey = Whiskey.new(whiskey_params)
    if @whiskey.save
      redirect_to whiskey_url(@whiskey), notice: 'Whiskey was successfully created.'
    else
      render :new
    end
  end

  def update
    if @whiskey.update(whiskey_params)
      redirect_to whiskey_url(@whiskey), notice: 'Whiskey was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @whiskey.destroy!
    redirect_to whiskeys_url, notice: 'Whiskey was successfully destroyed.'
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
      :description,
      :mouth_feel,
      :region,
      :processing,
      :flavor_strength,
      :rarity,
      :price,
      :amazon_link,
      :amazon_image_link,
      :amazon_impression_link,
      :drink_way_id,
      :snack_id,
      flavor_ids: []
    )
  end
end
