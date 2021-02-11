class PaymentsController < ApplicationController
	
	before_action :require_login
	before_action :admin_access
	
	def show
		@job = Job.find_by_id(params[:id])
		@payment = @job.payments.build
	end

	def new
		@payment = Payment.new
		@job = Job.find(params[:job_id])
		@payment.job_id = @job.id	#QUESTION: how to refactor these 3 lines? Also, why expose the user.id in a view if you don't have to?
		@payment.admin_id = @job.admin_id
		@payment.client_id = current_user.id
		byebug
	end

	def create
		@payment = Payment.new(payment_params)
		if @payment.save
			redirect_to edit_job_path(@payment.job_id)
			# byebug
		else
			
		end
	# redirect_to user_clients_path(@payment, @payment.id)
	end	
	
	def index
		if params[:user_id].present?
			@payments = Payment.find_by_id(current_user).clients
		#   @jobs = Payment.find_by_id(current_user).job_users
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
        params.require(:payment).permit(:amount, :client_id, :job_id, job_attributes: [:user_id, :job_id, :client_id])
    end

end

