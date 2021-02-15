class PaymentsController < ApplicationController
	
	before_action :require_login
	before_action :current_user
	before_action :admin_access, except: [:new, :create]
	
	def show
		find_job_by_id
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
			process_payment
		else #this handles payments (not refunds)
			@payment = Payment.new(payment_params)
			process_payment
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
		find_job_by_id
		@payment = Payment.new(job_id: @job.id, client_id: current_user)
	end
	
	def update
		byebug
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

	def process_payment
		if @payment.save
			flash[:notice] = "Transaction confirmed."
			redirect_to edit_job_path(@payment.job_id)
		else
			flash[:notice] = @payment.errors.full_messages
			render new_job_payment_path(@job)
		end
	end

	def find_job_by_id
		@job = Job.find_by_id(params[:id])
	end

end

