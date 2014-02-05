class GroupController < ApplicationController

	def show
		puts params_name = params[:name]

		@group_to_render = Group.where(["name = ?", params_name]).first
	
		#news feed

		@work_outs_to_render = Array.new()

		@group_to_render.users.each do |user|
			@work_outs_to_render.push(user.workouts)
		end

		@work_outs_to_render.flatten!


	end

end