module JobsHelper

	def all_contractors(job)
		if job.invoices.present?
			job.invoices.collect {|u| u.user}
		else 
			"please select your team"
		end
		# job.invoices.map {|u| u.user}
	end

	def client_of_job
		if @job.nil?
			"please select an admin"
		else
			job = Job.find_by(id: params[:id])
			job.client_id.present? 
			id = job.client_id
			User.find_by_id(id)
		end
	end

	def admin_of_job # this will break is admin_id of Jobs is nil
		job = Job.find_by(id: params[:id])
		if job.admin_id.present? 
			id = job.admin_id
			User.find_by_id(id)
		elsif nil
			return "please select an admin"
		end
	end

end
