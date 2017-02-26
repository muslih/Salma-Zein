class Admin::DashboardController < AdminController
	before_action :kitchen_only,only: [:index_kitchen]
	
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
