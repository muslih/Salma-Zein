class LoginController < ApplicationController
  def index
  end

  def new
    render layout: "blank"
  end

  def create
  	user = User.find_by(username: params[:login][:username])
    if user && user.authenticate(params[:login][:password])
    	log_in user
    	flash[:success] = 'Berhasil login'
      	redirect_to items_path
    else
    	flash.now[:danger] = 'Username / Password salah'
    	render 'new',layout: 'blank'
    end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
