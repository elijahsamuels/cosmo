class Invoice < ApplicationRecord

	belongs_to :user
	belongs_to :job
  	
	def self.sort_by_job(params) # scope
		@invoices = Invoice.where(user_id: params[:user_id]).order("job_id")   
	end

end