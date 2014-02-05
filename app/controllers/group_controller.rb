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

	def give_kudos


		workout_to_kudos = Workout.find(params['workout_id'])
		new_comment = workout_to_kudos.comments.new
		new_comment.user = current_user
		
		puts new_comment.save!

		puts new_comment.user.full_name		

		monster_award = Monsterawardcomment.new

		monster_award.comment = new_comment

		monster_award.save!

		render :text => request.POST


	end

end