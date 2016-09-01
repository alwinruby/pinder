class ProfilesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @user = current_user
    @profile = Profile.create(profile_params)
    @user.update({ :profile_id => @profile.id })
    redirect_to '/profiles'
  end

  private

  def profile_params
    params.require(:profile).permit(:owner_name, :owner_age, :gender, :sexual_preference, :owner_likes, :owner_dislikes, :pet_name, :pet_age, :pet_species, :pet_likes, :pet_dislikes, :owner_image, :pet_image)
  end

end
