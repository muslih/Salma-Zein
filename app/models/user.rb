class User < ApplicationRecord
	has_secure_password
	validates :username, :presence => {message: "Username harus di isi !!"}
	validates :email, :presence => {message: "Email harus di isi !!"}
	validates :password, :presence => {message: "Password harus di isi !!"}, on: :create
	validates :password_confirmation, :presence => {message: "Konfirmasi password harus di isi !!"}, on: :create
end
