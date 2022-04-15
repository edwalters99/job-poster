class CommentsController < ApplicationController
    before_action :check_for_login  #only allow access if logged in
    
    def new
        @comment = Comment.new 
        @job = Job.find params[:id]   
    end

    def create
        comment = Comment.create comment_params
        comment.save
        flash[:message] = "Your Comment has been posted!"
        redirect_to job_path params[:comment][:job_id] 
    end

    def edit 
        @comment = Comment.find params[:id]
        check_for_owner @comment  #protects against seeing the edit page for a job other than your own
    end

    def update
        comment = Comment.find params[:id]
        check_for_owner comment
        comment.update comment_params
        redirect_to job_path(comment.job_id)
      end

    def destroy
        comment = Comment.find params[:id]
        job = comment.job_id
        check_for_owner comment
        comment.destroy
        redirect_to job_path(job)
    end
    
    private
    def comment_params
        params.require(:comment).permit(:comment, :job_id, :user_id)
    end

end
