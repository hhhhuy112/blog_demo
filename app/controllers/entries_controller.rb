class EntriesController < ApplicationController
	def create
		@entry=current_user.entries.build(entry_params)
		if @entry.save
			flash[:success]="Create entry success"
			redirect_to root_url	
		else
			 render 'static_pages/home'
		end	
	end

	def show
		@entry = Entry.find(params[:id])
		
	end
	private 

	def entry_params
		params.require(:entry).permit(:title, :body);
	end
end
