class Message < ActiveRecord::Base
  attr_accessible :message, :subject
  belongs_to :user
  has_one :user
end
