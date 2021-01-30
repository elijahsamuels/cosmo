class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def index
    @jobs = Job.all
  end

  def create
    # @job = Job.find_or_create_by(job_params)
    @job = Job.new(job_params)
    if @job.save
      redirect_to job_path(@job)
    else
      "oh dear..."
    end
    # redirect_to job_path(@job)
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
    @client = Client.find(params[:id])
    @admin = Admin.find(params[:id])

  end
  
  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
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
    params.require(:job).permit!
  end

  # def start_date
  #   job_start_datetime
  # end

end
