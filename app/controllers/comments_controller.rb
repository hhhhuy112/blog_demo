class CommentsController < ApplicationController
	before_action :logged_in_user 
	def create
		@comment=current_user.comments.build(comment_params)
		if @comment.save
			flash[:success]="Create comment success"
			@entry = Entry.find(params[:comment][:entry_id])
			redirect_to @entry
		else
			flash[:danger]="Please Enter comment"
			@entry = Entry.find(params[:comment][:entry_id])
			redirect_to entry_path(id: @entry.id)
		end	
	end
	private 

	def comment_params
		params.require(:comment).permit(:content, :entry_id)
	end		
end
