class InvoicesController < ApplicationController

	# before_action :require_login
	before_action :current_user
	# before_action :admin_access, except: [:new, :create]
	
	def new
		@invoice = Invoice.new

		# @job = Job.find(params[:job_id])
	end

	def show
		byebug
		 @invoice = Invoice.where(job_id: params[:id]).where(user_id: params[:user_id]).reduce
		 
		#  @invoice = Invoice.where(job_id: params[:id]).where(user_id: params[:user_id]).reduce
		#  @invoice = Invoice.find_or_create_by(job_id: params[:id]).find_or_create_by(user_id: params[:user_id]).reduce
	end
		
		# invoice = Invoice.where(job_id: params[:id])
		# @invoice = invoice.where(user_id: params[:user_id])

		# user_id = params[:user_id].to_i
		# job_id = params[:id].to_i
		# @invoice = Invoice.where(params[user_id: user_id,  job_id: job_id])
		# byebug
		# @invoice = Invoice.users.where(params[:user_id])

		# jobs = Job.where(admin_id: current_user.id)
		# @jobs = jobs.where(status:s)
	
	def create
		byebug
		@invoice = Invoice.new(invoice_params)
		@invoice.save
		redirect_to edit_job_path(@invoice.job_id)
	end	
	
	def index
		@invoices = Invoice.where(user_id: params[:user_id]) 
		
		#this might not work?
		#user(admin or contractor) should be able to see a list of their invoices
		#ideally, if the invoice has been sent, the user should NOT be able to send another invoice. ie. they can only get paid once per job
	end

	def edit
	end
	
	def update
	end
	
	# def destroy # we don't ever want to delete a payment. We can always reverse/refund later   
	# end
	
	private
	
	def payment_params
		params.require(:invoice).permit! #(:payment_amount, )
	end
end