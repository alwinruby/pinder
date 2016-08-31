class PlayController < ApplicationController

  before_action :authenticate_user!

  def index
    @profiles = Profile.all.to_a
  end

end
