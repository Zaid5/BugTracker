class BugsController < ApplicationController
before_action :set_bug, only: [:show, :edit, :update, :destroy]
before_action :require_login
after_action :verify_authorized


  def index
    @bugs = Bug.all
    authorize @bugs
  end

  def show
  end

  def new
    @bug = Bug.new
    authorize @bug
  end

  def edit
  end

  def create
    @bug = Bug.new(bug_params.merge user: current_user)
    authorize @bug
    # @user = User.find_by_username(params[:username])

    respond_to do |format|
      if @bug.save
        ApplicationMailer.mailer(@bug).deliver_now if @bug.assign.present?
        format.html { redirect_to bugs_url, success: 'Bug is created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @bug.update(bug_params)
        ApplicationMailer.mailer(@bug).deliver_now if @bug.assign.present?
        format.html { redirect_to @bug, info: 'Bug was successfully updated.' }
      else
        format.html { render :edit, notice: 'There was an error processing your request!' }
      end
    end
  end

  def destroy
    @bug.destroy
    respond_to do |format|
      format.html { redirect_to bugs_url, danger: 'Bug is deleted.' }
    end
  end
  
  def catch_404
    raise ActionController::RoutingError.new(params[:path])
  end

  private
  def set_bug
    @bug = Bug.find(params[:id])
    authorize @bug
  end

  def bug_params
    params.require(:bug).permit(:title, :description, :image, :document, :assign, :username)
  end
end
