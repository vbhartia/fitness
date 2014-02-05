class Workout < ActiveRecord::Base
	include ActionView::Helpers
	
	belongs_to :user
	has_many :runnings
	has_many :comments
  	
end