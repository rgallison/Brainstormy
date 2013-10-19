# Colin
class Tag < ActiveRecord::Base
	attr_accessible :category
	has_and_belongs_to_many :ideas
end
