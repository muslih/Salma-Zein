class User < ApplicationRecord
	attr_accessor :remember_token
	has_many :employees
	has_secure_password
	validates :username, :presence => {message: "Username harus di isi !!"}
	validates :email, :presence => {message: "Email harus di isi !!"}
	validates :password, :presence => {message: "Password harus di isi !!"}, on: :create
	validates :password_confirmation, :presence => {message: "Konfirmasi password harus di isi !!"}, on: :create

	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		                                              BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def self.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget
		update_attribute(:remember_digest, nil)
	end
end
