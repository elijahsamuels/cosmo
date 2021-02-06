module JobsHelper


	def all_contractors(job)
		if job.job_users.present?
			job.job_users.collect {|u| u.user}
		else 
			"please select your team"
		end
		# job.job_users.map {|u| u.user}
	end

	def client_of_job
		if @job.nil?
			"please select an admin"
		else
			job = Job.find(params[:id])
			job.client_id.present? 
			id = job.client_id
			User.find_by_id(id)
		end
	end

	def admin_of_job # this will break is admin_id of Jobs is nil
		job = Job.find(params[:id])
		if job.admin_id.present? 
			id = job.admin_id
			User.find_by_id(id)
		elsif nil
			return "please select an admin"
		end
	end

end




def user_location(user)
    return "#{user.city}, #{user.state}" if user.city &&
user.state
    return "#{user.city}" if user.city
    "Unlisted"
   end
