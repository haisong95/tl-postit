class JobsController < ApplicationController
  before_action :set_jobs, only: [:show, :edit, :update]
  before_action :require_admin, only: [:create, :edit, :update, :new]



  def index
    @job = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = "Your job was created"
      redirect_to :back
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @job.update(job_params)
      flash[:notice] = "The job was updated"
      redirect_to jobs_path
    else
      render :back
    end   
  end

  def job_params
    params.require(:job).permit!
  end
  

  def set_jobs
    @job = Job.find(params[:id])
  end

end