class TastingNotesController < ApplicationController
  before_action :set_tasting_note, only: %i[ show edit update destroy ]

  def index
    @tasting_notes = TastingNote.all
  end

  def show
  end

  def new
    @tasting_note = TastingNote.new
  end

  def edit
  end

  def create
    @tasting_note = TastingNote.new(tasting_note_params)

      if @tasting_note.save
        redirect_to tasting_note_url(@tasting_note), notice: "Tasting note was successfully created."
      else
        render :new
      end
  end

  def update
    if @tasting_note.update(tasting_note_params)
      redirect_to tasting_note_url(@tasting_note), notice: "Tasting note was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @tasting_note.destroy
    redirect_to tasting_notes_url, notice: "Tasting note was successfully destroyed."
  end

  private
    def set_tasting_note
      @tasting_note = TastingNote.find(params[:id])
    end

    def tasting_note_params
      params.require(:tasting_note).permit(:comment, :user_id, :drink_way_id, :flavor_id)
    end
end
