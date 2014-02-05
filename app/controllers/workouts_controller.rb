class WorkoutsController < ApplicationController

	def add

		activity = params["activity"]

		if activity == "running"
			work_out = current_user.workouts.create()
			work_out.save!
			running = work_out.runnings.create()
			running.distance = params['distance'].to_f
			running.time = params['time'].to_f
			running.save!

		else if activity == "class"

			end
		end

		redirect_to dashboard_path

		#render text: params["activity"]
		

	end

end