class TastingNotesController < ApplicationController
  skip_before_action :require_login, only: :index
  before_action :set_tasting_note, only: %i[update destroy]

  def index
    notes = TastingNote.eager_load(:user, :whiskey, :drink_way, :flavors).order(updated_at: :desc)
    @pagy, @tasting_notes = pagy(notes)
  end

  def create
    @whiskey = Whiskey.find(params[:whiskey_id])
    @tasting_note =
      current_user.tasting_notes.build(tasting_note_params.merge(whiskey_id: @whiskey.id))
    if @tasting_note.save
      redirect_to whiskey_url(@whiskey), success: 'テイスティングノートを投稿しました！'
    else
      redirect_to whiskey_url(@whiskey), danger: 'テイスティングノートを投稿できませんでした。'
    end
  end

  def update
    if @tasting_note.update(tasting_note_params)
      redirect_to whiskey_url(@tasting_note.whiskey_id), success: 'テイスティングノートを更新しました！'
    else
      @whiskey = @tasting_note.whiskey
      redirect_to whiskey_url(@tasting_note.whiskey_id), danger: 'テイスティングノートを更新できませんでした。'
    end
  end

  def destroy
    @tasting_note.destroy!
    redirect_to whiskey_url(@tasting_note.whiskey_id), success: 'テイスティングノートを削除しました。'
  end

  private

  def set_tasting_note
    @tasting_note = current_user.tasting_notes.find(params[:id])
  end

  def tasting_note_params
    params.require(:tasting_note).permit(
      :comment,
      :drink_way_id,
      flavor_ids: []
    )
  end
end
