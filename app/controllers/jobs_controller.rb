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
    if @job.assigned_to.present?
        @assigned_user = User.find @job.assigned_to
    end
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
    @job = Job.find params[:id]
    check_for_owner @job  #protects against seeing the edit page for a job other than your own
  end

  def update
    job = Job.find params[:id]
    check_for_owner job
    job.update job_params
    redirect_to job
  end
    
  def destroy 
    job = Job.find params[:id]
    check_for_owner job
    job.destroy
    redirect_to my_jobs_path
  end

  def assign #assign a job to a comment poster
    job = Job.find params[:job_id]
    job.assigned_to = params[:assignee_user_id]
    job.save
    redirect_to job_path(job)
  end


private
  
def job_params

      params.require(:job).permit(:title, :desc, :price, :image_1, :image_2, :image_3, :assignee_user_id, :category_ids => [])
end

# def job_params
#   params[:job][:categories].reject!(&:blank?).map(&:to_i) # wild that this is necessary -_-
#   params.require(:job).permit(:title, :desc, :price, :image_1, :image_2, :image_3, :categories => [])
# end
end
