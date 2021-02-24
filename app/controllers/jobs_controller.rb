class JobsController < ApplicationController

  before_action :require_login, except: [:new, :create]
  before_action :current_user
  # before_action :current_client


  def new
    @user = User.new
    @job = @user.jobs.new
  end

  # create a new job and select an existing user. Maybe make this the find by/search feature

  # @job.users.build(user_params)
  # @job.save
  # redirect_to_edit_job_by_id
  # @job.client_id = params[:job][:user_attributes][:user_id]
  def create
    @job = Job.create(job_params)
    if current_user.admin?
      params[:job][:user_attributes][:user_id] = @job.users.reduce.id
      @job.client_id = @job.users.reduce.id
      save_job_or_render_errors
    else
      @job.client_id = session[:user_id]
      save_job_or_render_errors
    end
  end
  
  def index
    if params[:user_id].present?
      if User.find_by_id(params[:user_id]).admin?
        @jobs = Job.where(admin_id: current_user.id).sort_by_date(params)
        admin_status_sort
      else
        User.find_by_id(params[:user_id]).client?
        @jobs = Job.where(client_id: current_user.id).sort_by_date(params)
      end
    else
      @jobs = Job.sort_by_date(params)
    end

    # /jobs.json this shows the jobs data in json format
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @jobs}

    end

  end
  
  def show
    find_job_by_id
    find_client_by_job_client_id
    if current_user.id == @job.admin_id || @job.client_id
      redirect_to_edit_job_by_id #edit_user_job_path
    else
      redirect job_path(@job)
    end
  end
  
  def edit
    find_job_by_id
    find_client_by_job_client_id
    total_paid
    each_payment
  end
  
  def update
    find_job_by_id
    if @job.valid?
      @job.update(job_params)
      flash[:notice] = "Save confirmed."
      redirect_to_edit_job_by_id
    else
      flash[:error] = "Error!"
      # flash[:error] = @job.errors.full_messages
      redirect_to_edit_job_by_id
    end
  end
  
  def destroy
    find_job_by_id
    @job.destroy
    flash[:notice] = "Job is deleted."
    redirect_to jobs_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email.downcase, :phone, :address_1, :address_2, :city, :state, :zip, :user_id, :password, job_attributes: [:job_start_datetime, :address_1, :address_2, :city, :state, :zip, :description, :status, :client_id, :id, :admin_id, :total_amount])
    # admin_attributes: [:first_name]) #, client_attributes: [:first_name.downcase, :last_name.downcase, :email.downcase]
  end
  
  def job_params
    params.require(:job).permit(:job_start_datetime, :address_1, :address_2, :city, :state, :zip, :description, :status, :client_id, :id, :admin_id, :total_amount, user_attributes: [:first_name, :last_name, :email.downcase, :phone, :address_1, :address_2, :city, :state, :zip, :user_id, :password]) 
    # admin_attributes: [:first_name]) #, client_attributes: [:first_name.downcase, :last_name.downcase, :email.downcase]
  end
  
  def date_current
    DateTime.current
  end

  def admin_status_sort
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
  end

  def redirect_to_edit_job_by_id
    redirect_to edit_job_path(@job)
  end
  
  def each_payment 
    @each_payment = @job.payments.where(job_id: @job.id)
  end
    
  def find_client_by_job_client_id
    @client = User.find_by_id(@job.client_id)
  end

  def save_job_or_render_errors
    if @job.save
      redirect_to_edit_job_by_id
    else
      flash[:notice] = @job.errors.full_messages
      render :new #how to render form instead of just new
    end
  end

  def find_job_by_id
    @job = Job.find_by(id: params[:id])
  end



end

  # amt = j.map.each { |a| a.amount }
  #   # dates = j.map.each { |d| d.created_at }
  #   # @each_payment_and_date = amt.zip(dates).to_h
    
    # @each_payment = Hash.new(ep.amount: ep.created_at)  
    # @each_payment_date = j.map.each { |d| d.create_at }
    # hash = Hash[@job.payments.where(job_id: @job.id).map.each { |a| a.amount } { |amount| [amount, @job.payments.where(job_id: @job.id).map.each { |a| a.created_at }]} ]


  # def total_paid
  #   tp = @job.payments.where(job_id: @job.id)
  #   @total_paid = tp.map.each { |a| a.amount }.sum
  # end
  
  # remaining_balance = remaining_balance.each.with_index(1) { |p| p.amount }
    # @job.payments.each.with_index(1) { |p| p.amount }
        # @job = Job.find_by(id: params[:id])
    # @client = User.find_by_id(@job.client_id)

  # if payments.present? 
  #   payments do |p|
  #   p.paid_amount, p.created_at
  # end



  # MAKE THIS WORK IN PLACE OF THE INDEX METHOD
def status(s)
  jobs = Job.where(admin_id: current_user.id)
  @jobs = jobs.where(status:s)
end 

      #answered: how to refactor to use params[status: :status]???
      # @jobs = @jobs.find_by(params[status: :status])
      # @jobs = @jobs.find_by(status: params[:status])

      # this will list all the clients for the user based on the admin_id
      # @jobs = Job.find(current_user.id).invoices.map(&:user).each { |a| a.admin_id = current_user.id }
      
      # this will list all the clients for the user based on the client_id
      # @jobs = Job.find(current_user.id).invoices.map(&:user).each { |c| c.client_id = current_user.id }

      # @jobs = Job.find(current_user.id).invoices.map(&:user).each { |a| a.admin_id = 2 }

      # @jobs = User.find_by_id(current_user).invoices
      # @clients = User.find_by_id(current_user).clients

