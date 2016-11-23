class EntriesController < ApplicationController
	before_action :logged_in_user, only: [ :create, :destroy]
	before_action  :correct_user , only: :destroy

	def create
		@entry=current_user.entries.build(entry_params)
		if @entry.save
			flash[:success]="Create entry success"
			redirect_to root_url	
		else
			@entries =Entry.paginate(:per_page => 5,page: params[:page])
			render 'static_pages/home'
		end	
	end

	def show
		@entry = Entry.find(params[:id])
		@comments=@entry.feed.paginate(:per_page => 5,page: params[:page])
		@comment= @entry.feed.build if logged_in?
  	end

  	def destroy
  		@entry.destroy
    		flash[:success] = "Micropost deleted"
    		redirect_to request.referrer || root_url
  	end	
		
	
	private 

	def entry_params
		params.require(:entry).permit(:title, :body);
	end

	# Confirms the correct user.
    	def correct_user
      		@entry = current_user.entries.find_by_id  params[:id]
      		redirect_to root_url if @entry.nil?
   	 end
end
