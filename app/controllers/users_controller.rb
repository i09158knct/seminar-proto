class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @challenges = @user.challenges
    @answers = @user.answers.includes(:challenge)
  end
end
