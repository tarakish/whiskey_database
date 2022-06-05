class SearchesController < ApplicationController
  skip_before_action :require_login

  def new
    @q = Whiskey.ransack(params[:q])
  end
end
