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
	
	# payment_params[:amount] << payment_params[:amount].to_i*-1
	#ANSWERED multiple by -1 for the refund amount. 
	def create
		if payment_params[:payment_type] == "refund"
			refund_payment = Payment.new(payment_params)
			refund_payment.amount = refund_payment.amount*-1
			refund_payment.save
			byebug
			redirect_to edit_job_path(refund_payment.job_id)
		else
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

		


end

