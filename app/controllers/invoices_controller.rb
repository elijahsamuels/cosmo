class InvoicesController < ApplicationController

	# before_action :require_login
	# before_action :current_user
	# before_action :admin_access, except: [:new, :create]
	
	def show
		@job = Job.find_by_id(params[:id])
		@invoice = @job.invoices.build
	end

	def new
		@job = Job.find(params[:job_id])
		@payment = Payment.new
	end
	
	def create
	end	
	
	def index
	end

	def edit
	end
	
	def update
	end
	
	# def destroy # we don't ever want to delete a payment. We can always reverse/refund later   
	# end
	
	private
	
	def payment_params
		params.require(:payment).permit!#
	end





end
