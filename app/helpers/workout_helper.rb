module WorkoutHelper
	
	def render_work_out(workout_object, size)
		if running_object = workout_object.runnings.first
			if size == 'tile'
				
				render 'running/shared/tile', :running_object => running_object

				#running_object.distance.to_s

			else if size == 'long'
				
				render 'running/shared/long', :running_object => running_object
				
				end
			end
		
		end

	end

	def render_work_out_in_group(workout_object)
		if running_object = workout_object.runnings.first			
	
			render 'group/shared/running_type', :running_object => running_object

		end

	end

end