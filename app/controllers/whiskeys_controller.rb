class WhiskeysController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :authorize_whiskey, except: :show

  def index
    result = @q.result(distinct: true).eager_load(:whiskey_flavors, :flavors)
    @pagy, @searched_whiskeys = pagy(result)
  end

  def show
    authorize Whiskey
    @whiskey = Whiskey.find(params[:id])
    # 表示用
    @tasting_notes =
      @whiskey.tasting_notes.preload(:user).eager_load(:drink_way, :flavors).order(id: :desc)
    # 投稿用
    @tasting_note =
      current_user.tasting_notes.build if current_user
  end

  private

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
