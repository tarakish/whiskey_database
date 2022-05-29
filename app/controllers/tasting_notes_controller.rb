class TastingNotesController < ApplicationController
  before_action :set_tasting_note, only: %i[edit update destroy]

  def index
    @tasting_notes = TastingNote.all
  end

  def new
    @whiskey = Whiskey.find(params[:whiskey_id])
    @tasting_note = current_user.tasting_notes.build
  end

  def edit; end

  def create
    @whiskey = Whiskey.find(params[:whiskey_id])
    @tasting_note =
      current_user.tasting_notes.build(tasting_note_params.merge(whiskey_id: @whiskey.id))
    if @tasting_note.save
      redirect_to whiskey_path(@whiskey), notice: 'Tasting note was successfully created.'
    else
      render :new
    end
  end

  def update
    if @tasting_note.update(tasting_note_params)
      redirect_to tasting_note_url(@tasting_note), notice: 'Tasting note was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tasting_note.destroy
    redirect_to tasting_notes_url, notice: 'Tasting note was successfully destroyed.'
  end

  private

  def set_tasting_note
    @tasting_note = current_user.tasting_notes.find(params[:id])
  end

  def tasting_note_params
    params.require(:tasting_note).permit(:comment, :drink_way_id, :flavor_id)
  end
end