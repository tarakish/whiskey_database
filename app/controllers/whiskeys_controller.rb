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

    # レコメンド
    whiskeys_same_drink_way = Whiskey.where(drink_way_id: @whiskey.drink_way).where.not(id: @whiskey.id)
    # 見つからなかった場合のハンドリング
    original_flavors = @whiskey.flavors.map(&:category_before_type_cast)
    filtered_whiskeys = []
    whiskeys_same_drink_way.each do |whiskey_same_drink_way|
      similarity = 0
      comparison_flavors = whiskey_same_drink_way.flavors.map(&:category_before_type_cast).tally
      original_flavors.uniq.each do |i|
        similarity += comparison_flavors[i] unless comparison_flavors[i].nil?
      end
      filtered_whiskeys.push({whiskey: whiskey_same_drink_way, sim: similarity})
    end
    max_similarity = filtered_whiskeys.sort_by { |i| -i[:sim] }.first[:sim]
    # max_similarity == 0 の時は 抜けて「似ているウイスキーが見つかりませんでした…ウイスキーの登録をお待ち下さい！」
    @recommended_whiskey = filtered_whiskeys.select { |i| i[:sim] == max_similarity }.sample[:whiskey]

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
