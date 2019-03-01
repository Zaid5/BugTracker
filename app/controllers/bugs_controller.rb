  class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy]
  # before_action :require_login


  def index
    @bugs = Bug.all
  end

  def show
  end

  def new
    @bug = Bug.new
  end

  def edit
    # authorize @bug
  end

  def create
    @bug = Bug.new(bug_params)

    respond_to do |format|
      if @bug.save
        format.html { redirect_to @bug, success: 'Bug is created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to @bug, info: 'Bug was successfully updated.' }
      else
        format.html { render :edit, notice: 'There was an error processing your request!' }
      end
    end
  end

  def destroy
    # authorize @bug
    @bug.destroy
    respond_to do |format|
      format.html { redirect_to bugs_url, danger: 'Bug is deleted.' }
    end
  end

  private
    def set_bug
      @bug = Bug.find(params[:id])
      # authorize @bug
    end

    def bug_params
      params.require(:bug).permit(:title, :description, :image, :document, :status)
    end
end
