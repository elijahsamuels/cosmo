class InvoicesController < ApplicationController

	# before_action :require_login
	before_action :current_user
	# before_action :admin_access, except: [:new, :create]
	
	def new
		# @job = Job.find(params[:job_id])
		@invoice = Invoice.new
	end
	
	def show
		
		@invoice = Invoice.where(job_id: params[:id]).where(user_id: params[:user_id]).reduce
		# byebug
	end
	
	def create
		@invoice = Invoice.new(invoice_params)
		@invoice.save
		redirect_to edit_job_path(@invoice.job_id)
	end	
	
	def index
		@invoices = Invoice.where(user_id: params[:user_id])
	end
	
	def edit
		# @invoice = Invoice.find_by_id(params[:id])
		if Invoice.where(job_id: params[:id]).where(user_id: params[:user_id]).present?
			@invoice = Invoice.where(job_id: params[:id]).where(user_id: params[:user_id]).reduce
		else
			redirect_to user_invoices_path
		end
	end
	
	def update
		@invoice = Invoice.where(job_id: invoice_params[:id]).where(user_id: invoice_params[:user_id])
		# if @invoice.valid?
		@invoice.update(invoice_params)
		byebug
			redirect_to user_invoices_path(@current_user)

		# else
		# 	byebug
		# 	render user_invoice_path(@invoice.user_id)
		# end
	end
		
	private
	
	def invoice_params
		params.require(:invoice).permit(:job_id, :user_id, :date_invoice_sent, :invoice_amount, :id)
	end
end

	# need to see all the jobs based on the user id
	# @jobs = Job.where(id: @invoices.id)
	
	# @invoices = Invoice.where(user_id: params[:user_id])
	
	#this might not work?
	#user(admin or contractor) should be able to see a list of their invoices
	#ideally, if the invoice has been sent, the user should NOT be able to send another invoice. ie. they can only get paid once per job

	#  @invoice = Invoice.where(job_id: params[:id]).where(user_id: params[:user_id]).reduce
	#  @invoice = Invoice.find_or_create_by(job_id: params[:id]).find_or_create_by(user_id: params[:user_id]).reduce
	
	# invoice = Invoice.where(job_id: params[:id])
	# @invoice = invoice.where(user_id: params[:user_id])
	
	# user_id = params[:user_id].to_i
	# job_id = params[:id].to_i
	# @invoice = Invoice.where(params[user_id: user_id,  job_id: job_id])
	# @invoice = Invoice.users.where(params[:user_id])
	
	# jobs = Job.where(admin_id: current_user.id)
	# @jobs = jobs.where(status:s)
	