class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def new
  end

end
