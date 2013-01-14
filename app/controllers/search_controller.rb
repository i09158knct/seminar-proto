class SearchController < ApplicationController
  def show
    query = params[:q] || ""
    if query.empty?
      @challenges = []
      @users = []
      return
    end

    @challenges = Challenge.where("title like ?", "%" + query + "%").includes(:user)
    @users = User.where("name like ?", "%" + query + "%")
  end
end
