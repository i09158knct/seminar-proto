class AnswersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :authenticate_owner!, :only => [:edit, :update, :destroy]
  before_filter :set_correct_user_id_to_params, :only => [:create, :update]
  before_filter :set_challenge, :except => [:create_gist]
  before_filter :add_breadcrumbs, :except => [:create_gist]

  def index
    @answers = Answer.where(:challenge_id => @challenge.id)
      .includes(:user)
      .page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  def show
    @answer = Answer.find(params[:id])
    add_breadcrumb @answer.title, @answer

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answer }
    end
  end

  def new
    @answer = Answer.new(:challenge_id => params[:challenge_id])
    add_breadcrumb 'new', @answer

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer ||= Answer.find(params[:id])
    add_breadcrumb @answer.title, challenge_answer_path(@answer)
    add_breadcrumb "edit"
  end

  def create
    @answer = Answer.new(params[:answer])

    respond_to do |format|
      if @answer.save
        format.html { redirect_to [@challenge, @answer], notice: 'Answer was successfully created.' }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @answer ||= Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to challenge_answer_url(@answer), notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer ||= Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to challenge_answers_url(@challenge) }
      format.json { head :no_content }
    end
  end

  private
    def authenticate_owner!
      @answer = Answer.find(params[:id])
      unless @answer.user_can_edit?(current_user)
        redirect_to root_url, :alert => "You can't edit this answer."
      end
    end

    def set_correct_user_id_to_params
      params[:answer][:user_id] = current_user.id
    end

    def set_challenge
      @challenge = Challenge.find(params[:challenge_id])
    end

    def add_breadcrumbs
      add_breadcrumb 'Challenges', challenges_path
      add_breadcrumb @challenge.title, @challenge
      add_breadcrumb 'Answers', challenge_answers_path(@challenge)
    end
end
