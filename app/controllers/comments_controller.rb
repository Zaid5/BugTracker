class CommentsController < ApplicationController

	# before_action :find_bug!

	def index
	   @bug = Bug.find(params[:bug_id])
	end

	def create

		@bug = Bug.find(params[:bug_id])
	 	@comment = @bug.comments.create(params[:comment].permit( :content))
    redirect_to bug_path(@bug)
	end

  def destroy

   	 @bug = Bug.find(params[:bug_id])
		 @comment = @bug.comments.find(params[:id])
		 @comment.destroy
		 redirect_to bug_path(@bug)
  end

end
