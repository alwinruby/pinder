class PlayController < ApplicationController

  def index
    @profiles = Profile.all
  end

end
