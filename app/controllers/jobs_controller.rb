class JobsController < ApplicationController

  before_action :require_login, except: [:new, :create, :show]
  # before_action :admin_access

  def new
    @user = User.new
    @job = @user.jobs.new
  end

  # create a new job with the user_id attribute so that you can access that job via user/id/jobs/id
  def create
    @job = Job.create(job_params)
    if @job.save
      redirect_to user_job_path(params[:user_id], @job)
    else
      render :new #how to render form instead of just new
    end
    # @job = Job.new(job_params)
    # @client = User.new
    
    # @job = Job.create(job_params, client_id: @client.id) # this should work for just making a job. no associations
    # @job = @user.jobs.create(job_params)
    # binding.pry

    # @job.save
    # redirect_to job_path(@job)

    # redirect_to user_job_path(params[current_user.id], @job) #/users/:user_id/jobs/:id(.:format)	
  end

  def index
    if params[:user_id].present?
      @jobs = Job.where(admin_id: current_user.id)
      if params[:status].present?   
        if params[:status] == "Inquiry"
          @jobs = @jobs.where(status: "Inquiry")
        elsif params[:status] == "Tentative"
          @jobs = @jobs.where(status: "Tentative")
        elsif params[:status] == "Confirmed"
          @jobs = @jobs.where(status: "Confirmed")
        elsif params[:status] == "Completed"
          @jobs = @jobs.where(status: "Completed")
        elsif params[:status] == "Postponed"
          @jobs = @jobs.where(status: "Postponed")
        elsif params[:status] == "Cancelled"
          @jobs = @jobs.where(status: "Cancelled")
        end
      end  
    elsif !params[:user_id].present?
    @jobs = Job.all
  end
end


# MAKE THIS WORK IN PLACE OF THE ABOVE INDEX METHOD
def status(s)
  jobs = Job.where(admin_id: current_user.id)
  @jobs = jobs.where(status:s)
end 

        #answered: how to refactor to use params[status: :status]???
        # @jobs = @jobs.find_by(params[status: :status])
        # @jobs = @jobs.find_by(status: params[:status])


      # this will list all the clients for the user based on the admin_id
      # @jobs = Job.find(current_user.id).job_users.map(&:user).each { |a| a.admin_id = current_user.id }
      
      # this will list all the clients for the user based on the client_id
      # @jobs = Job.find(current_user.id).job_users.map(&:user).each { |c| c.client_id = current_user.id }

      # @jobs = Job.find(current_user.id).job_users.map(&:user).each { |a| a.admin_id = 2 }

      # @jobs = User.find_by_id(current_user).job_users
      # binding.pry
      # @clients = User.find_by_id(current_user).clients

  def show
    @job = Job.find_by(params[:id])
    @client = User.find_by_id(@job.client_id)
    if current_user.id == @job.admin_id || @job.client_id
      redirect_to edit_job_path(@job) #edit_user_job_path
    else
      redirect job_path(@job)
    end
  end

  def edit
    @job = Job.find(params[:id])
    @client = User.find_by_id(@job.client_id)
    total_paid
    each_payment
  end
  
  def update
    @job = Job.find(params[:id])
    if @job.valid?
      @job.update(job_params)
      flash[:notice] = "Save confirmed."
      redirect_to edit_job_path(@job)
    else
      flash[:error] = "Error!"
      # flash[:error] = @job.errors.full_messages
      redirect_to edit_job_path(@job)
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = "Job is deleted."
    redirect_to jobs_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email.downcase, :phone, :address_1, :address_2, :city, :state, :zip, job_attributes: [:job_start_datetime, :address_1, :address_2, :city, :state, :zip, :description, :status, :client_id, :id, :admin_id])
    # admin_attributes: [:first_name]) #, client_attributes: [:first_name.downcase, :last_name.downcase, :email.downcase]
  end

  def job_params
    params.require(:job).permit(:job_start_datetime, :address_1, :address_2, :city, :state, :zip, :description, :status, :client_id, :id, :admin_id, user_attributes: [:first_name, :last_name, :email.downcase, :user_id]) 
    # admin_attributes: [:first_name]) #, client_attributes: [:first_name.downcase, :last_name.downcase, :email.downcase]
  end

  def date_current
    DateTime.current
  end

  def list_users_for_job
     # if user is present?
      # list user attributes
  # elsif user == nil
    # "no user selected"
  end
  
  def each_payment 
  @each_payment = @job.payments.where(job_id: @job.id)

  # amt = j.map.each { |a| a.amount }
  #   # dates = j.map.each { |d| d.created_at }
  #   # @each_payment_and_date = amt.zip(dates).to_h
    
  end
    # @each_payment = Hash.new(ep.amount: ep.created_at)  
    # @each_payment_date = j.map.each { |d| d.create_at }
    # hash = Hash[@job.payments.where(job_id: @job.id).map.each { |a| a.amount } { |amount| [amount, @job.payments.where(job_id: @job.id).map.each { |a| a.created_at }]} ]


  # def total_paid
  #   byebug
  #   tp = @job.payments.where(job_id: @job.id)
  #   @total_paid = tp.map.each { |a| a.amount }.sum
  # end
  
  # remaining_balance = remaining_balance.each.with_index(1) { |p| p.amount }
    # @job.payments.each.with_index(1) { |p| p.amount }
        # @job = Job.find(params[:id])
    # @client = User.find_by_id(@job.client_id)

  # if payments.present? 
  #   payments do |p|
  #   p.paid_amount, p.created_at
  # end

end

