class JobsController < ApplicationController

def index
  @job = Job.all
end

def show
  @job = Job.find(params[:id])
end



end