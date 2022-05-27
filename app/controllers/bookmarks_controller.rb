class BookmarksController < ApplicationController
  before_action :set_whiskey

  def create
    current_user.bookmarks.find_or_create_by(whiskey_id: @whiskey.id)
    redirect_to whiskey_path(@whiskey), notice: "Bookmark was successfully created."
  end

  def destroy
    bookmarks = current_user.bookmarks.find_by!(whiskey_id: @whiskey.id)
    bookmarks.destroy!
    redirect_to whiskey_path(@whiskey), notice: "Bookmark was successfully destroyed."
  end

  private
    def set_whiskey
      @whiskey = Whiskey.find(params[:whiskey_id])
    end
end
