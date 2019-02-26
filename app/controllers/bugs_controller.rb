class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy]

  def index
    @bugs = Bug.all
  end

  def show
  end

  def new
    @bug = Bug.new
  end

  def edit
  end

  def create
    @bug = Bug.new(bug_params)

    respond_to do |format|
      if @bug.save
        format.html { redirect_to @bug, notice: 'Bug is created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to @bug, notice: 'Bug was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @bug.destroy
    respond_to do |format|
      format.html { redirect_to bugs_url, notice: 'Bug is deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_bug
      @bug = Bug.find(params[:id])
    end

    def bug_params
      params.require(:bug).permit(:title, :description)
    end
end
