class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find params[:id]
    @users = User.all
  end

  def edit
  end

  def new
  end
end
