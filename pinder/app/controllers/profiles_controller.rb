class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    Profile.create(profile_params)
    redirect_to '/profiles'
  end

  private

  def profile_params
    params.require(:profile).permit(:owner_name, :owner_age, :owner_likes, :owner_dislikes, :pet_name, :pet_age, :pet_species, :pet_likes, :pet_dislikes)
  end


end
