class Message < ActiveRecord::Base
  attr_accessible :body, :subject, :status, :sender, :receiver,:parent, :child
  belongs_to :sent, :class_name => 'User'
  has_and_belongs_to_many :received, :class_name => 'User'
  belongs_to :parent, :class_name => 'Message'
  has_one :child, :class_name => 'Message'
end
