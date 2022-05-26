class SearchesController < ApplicationController
  def new
    @q = Whiskey.ransack(params[:q])
  end
end
