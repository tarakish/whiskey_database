class ApplicationController < ActionController::Base
  include Banken
  protect_from_forgery
end
