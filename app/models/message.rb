class Message < ActiveRecord::Base
  attr_accessible :message, :subject, :status, :sender, :receiver
  belongs_to :sent, :class_name => 'User'
  has_and_belongs_to_many :received, :class_name => 'User'
  belongs_to :parent, :class_name => 'Message'
  has_one :child, :class_name => 'Message'
end
