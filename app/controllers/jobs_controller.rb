class JobsController < ApplicationController
  before_action :check_for_login  #only allow access if logged in
  
  def index
    @jobs = Job.all
  end

  def index_my
    @jobs = @current_user.jobs
  end

 
  def show
    @job = Job.find params[:id]
  end

  
  def new
    @job = Job.new
  end
  
  def create
    @job = Job.create job_params
    @job.save
    @current_user.jobs << @job
    redirect_to @job
  end
  
  def edit

  end

  private
  def job_params
    params.require(:job).permit(:title, :desc, :price, :image_1, :image_2, :image_3)
  end

end
