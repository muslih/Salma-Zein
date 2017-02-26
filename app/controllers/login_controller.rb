class LoginController < ApplicationController
  def index
  end

  def new
    render layout: "blank"
  end

  def create
  	user = User.find_by(username: params[:login][:username].downcase)
    if user && user.authenticate(params[:login][:password])
    	log_in user
    	params[:login][:remember_me] == '1' ? remember(user) : forget(user)
    	flash[:success] = "Selamat datang #{user.employee.name} - #{user.employee.role}"
      if current_user_administrator
        redirect_to admin_administrator_dash_path
      elsif user.employee.role == 'kitchen'
        redirect_to admin_kitchen_dash_path
      elsif current_user_quality_control
        redirect_to admin_quality_control_dash_path
      elsif current_user_logistik
        redirect_to admin_logistik_dash_path
      elsif current_user_administrasi
        redirect_to admin_administrasi_dash_path
      elsif current_user_operational
        redirect_to admin_operational_dash_path
      end
    else
    	flash[:danger] = 'Username / Password salah'
    	render 'new',layout: 'blank'
    end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
