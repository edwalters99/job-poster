class JobsController < ApplicationController
    before_action :check_for_login  #only allow access if user is logged in

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
        if full_address_not_supplied #helper function below (private)
          flash[:alert] = "Update address in your profile to see Jobs near you."
        end
        @jobs = User.near([@current_user.latitude, @current_user.longitude]).map(&:jobs).
        flatten
      else
          @jobs = Job.order(created_at: :desc) #default option when page is loaded (newest first)
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
        @parameter = params[:search].downcase.strip
        @jobs = Job.where("lower(title) LIKE :search", search: "%#{ @parameter }%")
      end
    end
    

    def show
      @job = Job.find params[:id]
      if @job.assigned_to.present? # @assigned_user is used in view to conditionally render elements of the page
        @assigned_user = User.find @job.assigned_to
      end
    end
  

    def new
      @job = Job.new
    end
  

    def create
      @job = Job.new job_params
      if params[:job][:images].present? #cloudinary image upload process
        params[:job][:images].each do |image|
          req = Cloudinary::Uploader.upload(image)
          @job.images << req["public_id"]
        end
      end
      if @job.save
        @current_user.jobs << @job 
        flash[:message] = "Job Posted Successfully!"
        redirect_to @job
      else 
        render :new # render the form again to re-attempt job creation
      end
    end


    def edit
      @job = Job.find params[:id]
      check_for_owner @job  # protects against seeing the edit page for a job that doesn't belong to the current user
    end


    def update
      @job = Job.find params[:id]
      check_for_owner @job
      if params[:job][:images].present? #cloudinary image upload process
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


    def assign #assign a job to a user (comment owner)
      job = Job.find params[:job_id]
      job.assigned_to = params[:assignee_user_id]
      job.save
      redirect_to job
    end


    def add_photos
      @job = Job.find params[:id]
      check_for_owner @job 
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

    def full_address_not_supplied
      @current_user.address_num.blank? || @current_user.address_street.blank? ||  @current_user.address_city.blank? || @current_user.address_country.blank? ||  @current_user.address_postcode.blank? 
  end

end
