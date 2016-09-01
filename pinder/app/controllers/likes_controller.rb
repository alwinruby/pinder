class LikesController < ApplicationController


  def new
    @profile = Profile.find(params[:profile_id])
    @like = @profile.likes.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @profile.likes.create
    if @profile.likes != 0
    redirect_to "/profiles/show"
    else
      redirect_to "/"
    end
  end

end
