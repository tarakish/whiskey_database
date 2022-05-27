class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ destroy ]

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to bookmark_url(@bookmark), notice: "Bookmark was successfully created."
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_url, notice: "Bookmark was successfully destroyed."
  end

  private
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def bookmark_params
      params.require(:bookmark).permit(:user_id, :whiskey_id)
    end
end
