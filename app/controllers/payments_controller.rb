class PaymentsController < ApplicationController
	
	before_action :require_login
	before_action :current_user
	before_action :admin_access, except: [:new, :create]
	
	def show
		@job = Job.find_by_id(params[:id])
		@payment = @job.payments.build
	end

	def new
		@job = Job.find(params[:job_id])
		@payment = Payment.new
	end
	
	def create
		if payment_params[:payment_type] == "refund"
			@payment = Payment.new(payment_params)
			@payment.amount = @payment.amount*-1
			@payment.save
			redirect_to edit_job_path(@payment.job_id)
		else #this handles payments (not refunds)
			@payment = Payment.new(payment_params)
			@payment.save
			redirect_to edit_job_path(@payment.job_id)
		end
	end	
	
	def index
		if params[:user_id].present?
			@payments = Payment.find_by_id(current_user).clients
		#   @jobs = Payment.find_by_id(current_user).invoices
		elsif !params[:user_id].present?
			@payments = Payment.where(client: true)
		end
	end

	def edit
		@job = Job.find_by_id(params[:id])
		@payment = Payment.new(job_id: @job.id, client_id: current_user)
	end
	
	def update
		@payment = Payment.find_by_id(params[:id])
		if @payment.valid?
			@payment.update(params)
			flash[:notice] = "Payment confirmed."
			redirect_to payment_path(@payment)
		else
			flash[:error] = "Yikes! Problem with payment!"
			# flash[:error] = @job.errors.full_messages
			redirect_to payment_path(@payment)
		end
	end
	
	# def destroy # we don't ever want to delete a payment. We can always reverse/refund later   
	# end
	
	private
	
	def payment_params
        params.require(:payment).permit(:amount, :client_id, :job_id, :payment_type, job_attributes: [:user_id, :job_id, :client_id])
    end

end

