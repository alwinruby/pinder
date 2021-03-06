class ProfilesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    if !session[:profile_index]
      session[:profile_index] = 0
    end
    @profiles = Profile.all.to_a
  end

  def new
    @profile = Profile.new
  end

  def create
    @user = current_user
    @profile = Profile.create(profile_params)
    if @profile.save
      @user.update({ :profile_id => @profile.id })
      @profile.update({ :user_id => @user.id })
      redirect_to '/profiles'
    else
      render 'new'
    end
  end

  def show
    @profile = Profile.find(params[:id])
    @profiles = Profile.all.to_a
  end

  def update
    session[:profile_index] += 1
    redirect_to '/'
  end

  private

  def profile_params
    params.require(:profile).permit(:owner_name, :owner_age, :gender, :sexual_preference, :owner_likes, :owner_dislikes, :pet_name, :pet_age, :pet_species, :pet_likes, :pet_dislikes, :owner_image, :pet_image)
  end

end
