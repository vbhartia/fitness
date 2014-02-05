class Comment < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :workout
	has_one :monsterawardcomment

end