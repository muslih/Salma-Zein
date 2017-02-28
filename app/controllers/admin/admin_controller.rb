# class LoginController < ApplicationController
class AdminController < ApplicationController
  before_action :login_only

  def login_only
  	unless logged_in?
  		flash[:danger] = "Login terlebih dahulu"
  		redirect_to root_path
  	end
  end
end
