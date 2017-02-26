module LoginHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

	def current_user?(user)
		user == current_user
	end

	def current_user_admin
		current_user.employee.role == 'admin'
	end

	def current_user_administrator
		current_user.employee.role == 'administrator'
	end

	def current_user_kitchen
		current_user.employee.role == 'kitchen'
	end

	def current_user_quality_control
		current_user.employee.role == 'qualitycontrol'
	end

	def current_user_logistik
		current_user.employee.role == 'logistik'
	end

	def current_user_administrasi
		current_user.employee.role == 'administrasi'
	end

	def current_user_operational
		current_user.employee.role == 'operational'
	end

  	def current_user
		if (user_id = session[:user_id])
			@current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
			user = User.find_by(id: user_id)
			if user && user.authenticated?(cookies[:remember_token])
				log_in user
				@current_user = user
			end
		end
	end

  	def logged_in?
		!current_user.nil?
	end

	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end

	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end

	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end

	def store_location
		session[:forwarding_url] = request.original_url if request.get?
	end
end
