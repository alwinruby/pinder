class LikesController < ApplicationController


  def new
    @profile = Profile.find(params[:profile_id])
    @like = @profile.likes.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @profile.likes.create()
    redirect_to "/"
  end

end
