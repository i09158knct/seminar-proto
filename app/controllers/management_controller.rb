class ManagementController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = current_user
    @challenges = @user.challenges
    @answers = @user.answers
  end
end
