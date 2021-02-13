class InvoicesController < ApplicationController

	# before_action :require_login
	before_action :current_user
	# before_action :admin_access, except: [:new, :create]
	
	def new
		@invoice = Invoice.new
		# @job = Job.find(params[:job_id])
	end

	def show
		# byebug
		@invoice = Invoice.find_by(params[user_id: :user_id, job_id: :job_id])
		# @invoice = Invoice.users.where(params[:user_id])

		# @job = Job.find_by_id(params[:id])
		# @invoice = @job.invoices.build
	end
	
	def create
		byebug
		@invoice = Invoice.new(invoice_params)
		@invoice.save
		redirect_to edit_job_path(@invoice.job_id)
		# if invoice_params[:invoice_type] == "refund"
		# 	@invoice = Invoice.new(invoice_params)
		# 	@invoice.amount = @invoice.amount*-1
		# else #this handles invoices (not refunds)
		# 	@invoice = Invoice.new(invoice_params)
		# 	@invoice.save
		# 	redirect_to edit_job_path(@invoice.job_id)
		# end
	end	
	
	def index

		# byebug
		@invoices = Invoice.where(user_id:[current_user]) #this might not work?
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