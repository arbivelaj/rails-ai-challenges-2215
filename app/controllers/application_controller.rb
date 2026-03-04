class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_challenges

  def set_challenges
    @challenges = Challenge.all
  end

end
