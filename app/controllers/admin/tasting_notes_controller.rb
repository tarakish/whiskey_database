class Admin::TastingNotesController < Admin::BaseController
  before_action :authorize_user
  before_action :set_tasting_note, only: %i[edit update destroy]

  def index
    @tasting_notes = TastingNote.eager_load(:user, :drink_way, :whiskey).order(:id)
  end

  def new
    @tasting_note = TastingNote.new
  end

  def edit; end


  def create
    @tasting_note = TastingNote.new(tasting_note_params)
    if @tasting_note.save
      redirect_to admin_tasting_notes_url, success: '作成しました！'
    else
      render :new
    end
  end

  def update
    if @tasting_note.update(tasting_note_params)
      redirect_to admin_tasting_notes_url, success: '更新しました！'
    else
      render :edit
    end
  end

  def destroy
    @tasting_note.destroy!
    redirect_to admin_tasting_notes_url, danger: 'テイスティングノートを削除しました。'
  end

  private

  def set_tasting_note
    @tasting_note = TastingNote.find(params[:id])
  end

  def authorize_user
    authorize TastingNote, policy_class: ApplicationPolicy
  end

  def tasting_note_params
    params.require(:tasting_note).permit(
      :comment,
      :drink_way_id,
      :whiskey_id,
      :user_id,
      flavor_ids: []
    )
  end
end
