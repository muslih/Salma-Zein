class Admin::DashboardController < AdminController
	before_action :current_user_administrator ,only: [:index_administrator]
	before_action :current_user_kitchen ,only: [:index_kitchen]
	before_action :current_user_quality_control ,only: [:index_quality_control]
	before_action :current_user_logistik ,only: [:index_logistik]
	before_action :current_user_administrasi ,only: [:index_administrasi]
	before_action :current_user_operational ,only: [:index_operational]
	
	def index_administrator
	end

	def index_kitchen
		@title = "test"
	end

	def index_quality_control
	end

	def index_logistik
	end

	def index_administrasi
	end

	def index_operational
	end
end
