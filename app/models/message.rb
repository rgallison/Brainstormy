class Message < ActiveRecord::Base
  attr_accessible :message, :subject
  has_and_belongs_to_many :users
end
