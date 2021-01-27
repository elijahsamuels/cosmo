class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def index
    @jobs = Job.all
  end

  def create
    @job = Job.find_or_create_by(job_params)
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
    @job.update(job_params)
    redirect_to job_path(@job)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = "Job is deleted."
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:email)
  end

end
