class JobsController < ApplicationController

  # before_action :require_login, except: [:new, :create, :show]
  # before_action :admin_access

  def new
    @user = User.new
    @job = @user.jobs.new
    # @client = User.new
    # @job = @client.jobs.build #hows this work?
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
    elsif !params[:user_id].present?
      @jobs = Job.all
    end
  end

      # this will list all the clients for the user based on the admin_id
      # @jobs = Job.find(current_user.id).job_users.map(&:user).each { |a| a.admin_id = current_user.id }
      
      # this will list all the clients for the user based on the client_id
      # @jobs = Job.find(current_user.id).job_users.map(&:user).each { |c| c.client_id = current_user.id }

      # @jobs = Job.find(current_user.id).job_users.map(&:user).each { |a| a.admin_id = 2 }

      # @jobs = User.find_by_id(current_user).job_users
      # binding.pry
      # @clients = User.find_by_id(current_user).clients

  def show
    @job = Job.find(params[:id])
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
    params.require(:user).permit(:first_name, :last_name, :email.downcase, job_attributes: [:job_start_datetime, :address_1, :address_2, :city, :state, :zip, :description, :status, :client_id, :id, :admin_id])
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




end
