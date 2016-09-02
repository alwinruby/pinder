class LikesController < ApplicationController

  def index
    @profiles = Profile.all.to_a
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @like = @profile.likes.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @profile.likes.create
    redirect_to profile_likes_path
  end

end
