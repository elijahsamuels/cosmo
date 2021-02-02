class JobsController < ApplicationController
  def new
    @job = Job.new
    # @job.build_client

  end

  def index
    @jobs = Job.all
  end

  def create
    @job = Job.new(job_params)
    @job.save
    redirect_to job_path(@job)
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
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

  def job_params
    params.require(:job).permit!#(:address_1, :address_2, :city, :state, :zip, :description, :status, :admin_id, :client_id, :client, :job_start_datetime) # admin_attributes: [:first_name]) #, client_attributes: [:first_name.downcase, :last_name.downcase, :email.downcase]
  end

  def date_current
    DateTime.current
  end

  def list_users_for_job
     # if user is present?
      # list user atts
  # elsif user == nil
    # "no user selected"
  end

  # u = Job.all
  # u = job.job_users
  # u.find_by(params[:id]).user.first_name 



  # def start_date
  #   job_start_datetime
  # end

end
