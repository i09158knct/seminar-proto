class ReviewsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :authenticate_owner!, :only => [:edit, :update, :destroy]
  before_filter :set_correct_user_id_to_params, :only => [:create, :update]

  def index
    @reviews = Review.where(:answer_id => params[:answer_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  def new
    @review = Review.new(:answer_id => params[:answer_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  def edit
    @review ||= Review.find(params[:id])
  end

  def create
    @review = Review.new(params[:review])

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @review ||= Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review ||= Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to @answer }
      format.json { head :no_content }
    end
  end

  private
    def authenticate_owner!
      @review = Review.find(params[:id])
      unless @review.user_can_edit?(current_user)
        redirect_to root_url, :alert => "You can't edit this review."
      end
    end

    def set_correct_user_id_to_params
      params[:review][:user_id] = current_user.id
    end
end
