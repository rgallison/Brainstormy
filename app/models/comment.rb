# Lindsey
class Comment < ActiveRecord::Base

  attr_accessible :rank, :text, :idea_id, :user_id
  belongs_to :user #user that posted comment
  belongs_to :idea #idea to which comment was posted
  # has_many :attachments, :as => :attachable, :dependent => :destroy

  acts_as_votable
end


