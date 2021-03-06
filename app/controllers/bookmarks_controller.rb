class BookmarksController < ApplicationController
  before_action :set_whiskey

  def create
    current_user.bookmarks.find_or_create_by(whiskey_id: @whiskey.id)
  end

  def destroy
    bookmark = current_user.bookmarks.find_by!(whiskey_id: @whiskey.id)
    bookmark.destroy!
  end

  private

  def set_whiskey
    @whiskey = Whiskey.find(params[:whiskey_id])
  end
end
