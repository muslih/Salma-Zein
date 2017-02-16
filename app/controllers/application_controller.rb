class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :warning, :danger, :info
  include LoginHelper

  private
  def login_only
    unless logged_in?
	  store_location
      flash[:danger] = "Login terlebih dahulu"
      redirect_to login_url
    end
  end
end
