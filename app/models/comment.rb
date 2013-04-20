class Comment < ActiveRecord::Base

  attr_accessible :rank, :text
  belongs_to :user #user that posted comment
  belongs_to :idea #idea to which comment was posted
end


