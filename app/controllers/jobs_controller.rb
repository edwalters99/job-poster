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
    if @job.save
      @current_user.jobs << @job
      redirect_to @job
    else 
      render :new #render the form again to re-attempt job
    end
  end
  
  def edit

  end

  def destroy 
    job = Job.find params[:id]
    check_for_owner job
    job.destroy
    redirect_to my_jobs_path
  end

private
  
def job_params
   
      params.require(:job).permit(:title, :desc, :price, :image_1, :image_2, :image_3, :category_ids => [])
end

# def job_params
#   params[:job][:categories].reject!(&:blank?).map(&:to_i) # wild that this is necessary -_-
#   params.require(:job).permit(:title, :desc, :price, :image_1, :image_2, :image_3, :categories => [])
# end
end
