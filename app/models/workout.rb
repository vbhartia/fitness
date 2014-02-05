class Workout < ActiveRecord::Base
	include ActionView::Helpers
	
	belongs_to :user
	has_many :runnings
  	
end