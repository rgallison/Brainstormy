class User < ActiveRecord::Base
	attr_accessible :username, :name, :email, :password, :user_id
	has_many :comments
	has_many :ideasS
end