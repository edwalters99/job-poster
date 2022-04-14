class JobsController < ApplicationController
    before_action :check_for_login  #only allow access if logged in
  
    def index
      if params[:sort] == "created_at"
        @jobs = Job.order(created_at: :desc)
      elsif
        params[:sort] == "created_at_reverse"
          @jobs = Job.order(:created_at)
      elsif
        params[:sort] == "price"
          @jobs = Job.order(:price)
      elsif
        params[:sort] == "price_reverse"
          @jobs = Job.order(price: :desc)
      elsif
        params[:sort] == "distance"
        @jobs = User.near([@current_user.latitude, @current_user.longitude]).map(&:jobs).flatten
      else
          @jobs = Job.order(params[:created_at])
      end
    end
   

    def index_my # Jobs posted by current_user
      @jobs = @current_user.jobs
    end


    def index_my_assigned # Jobs assigned to current_user
      @jobs = Job.all
    end

    
    def search
      if params[:search].blank?
        redirect_to root_path
      else
        @parameter = params[:search].downcase
        @results = Job.where("lower(title) LIKE :search", search: "%#{ @parameter }%")
      end
    end
    

    def show
      @job = Job.find params[:id]
      if @job.assigned_to.present? # @assigned_user used in view to conditionally render elements of the page
        @assigned_user = User.find @job.assigned_to
      end
    end
  


    def new
      @job = Job.new
    end
  

    def create
      @job = Job.new job_params
      if params[:job][:images].present?
        params[:job][:images].each do |image|
          req = Cloudinary::Uploader.upload(image)
          @job.images << req["public_id"]
        end
      end
      if @job.save
        @current_user.jobs << @job
        redirect_to @job
      else 
        render :new # render the form again to re-attempt job creation
      end
    end


    def edit
      @job = Job.find params[:id]
      check_for_owner @job  # protects against seeing the edit page for a job other than your own
    end


    def update
      @job = Job.find params[:id]
      check_for_owner @job
      if params[:job][:images].present?
        params[:job][:images].each do |image|
          req = Cloudinary::Uploader.upload(image)
          @job.images << req["public_id"]
        end
      end
      @job.update_attributes job_params
      @job.save
      redirect_to @job
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


    def add_photos
      @job = Job.find params[:id] 
    end


    def delete_photos
      job = Job.find params[:id]
      check_for_owner job
      job.images = []
      job.save
      redirect_to edit_job_path(job)
    end


    private
  
    def job_params
      params.require(:job).permit(:title, :desc, :price, :assignee_user_id, :category_ids => [])
    end

end
