class User < ApplicationRecord
	has_secure_password
	validates :username, :presence => {message: "Username harus di isi !!"}
	validates :email, :presence => {message: "Email harus di isi !!"}
	validates :password, :presence => {message: "Password harus di isi !!"}, on: :create
	validates :password_confirmation, :presence => {message: "Konfirmasi password harus di isi !!"}, on: :create

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		                                              BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

end
