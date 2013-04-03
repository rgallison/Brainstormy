class User < ActiveRecord::Base
	attr_accessible :username, :name, :email, :password, :user_id
	has_many :comments, :as => :userOn
	has_many :ideas
end