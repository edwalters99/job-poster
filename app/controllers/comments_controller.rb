class CommentsController < ApplicationController
    before_action :check_for_login  #only allow access if logged in
    
    def new
        @comment = Comment.new 
        @job = Job.find params[:id]   
    end

    def create
        @comment = Comment.create comment_params
        @comment.save
        redirect_to job_path params[:comment][:job_id] 
    end
    
    private
    def comment_params
        params.require(:comment).permit(:comment, :job_id, :user_id)
    end
  

end
