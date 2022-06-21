class WhiskeysController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    result =
      @q.result(distinct: true).eager_load(:bookmarks, :tasting_notes).order(updated_at: :desc)
    @pagy, @searched_whiskeys = pagy(result)
  end

  def show
    @whiskey = Whiskey.find(params[:id])
    # 表示用
    @tasting_notes =
      @whiskey.tasting_notes.preload(:user).eager_load(:drink_way, :flavors).order(id: :desc)
    # 投稿用
    @tasting_note = current_user.tasting_notes.build if current_user
    
  end

  private

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
