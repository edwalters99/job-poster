class JobsController < ApplicationController
  before_action :check_for_login  #only allow access if logged in
  
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find params[:id]
  end

  def edit
  end

  def new
  end
end
