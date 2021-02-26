class Invoice < ApplicationRecord

	belongs_to :user
	belongs_to :job
  	
	def self.sort_by_job(params) # scope
		@invoices = Invoice.where(user_id: params[:user_id]).order("job_id")   
		# @invoices = Invoice.where(:created_at => Time.now)
		# Invoice.where(:created_at => (Time.now - 15.days)..Time.now)
		# @invoices = Invoice.where(created_at: 9.days.ago).order("job_id")
	end

	def self.recent_games
		Game.where(:created_at => (Time.now - 15.days)..Time.now)
	end


end