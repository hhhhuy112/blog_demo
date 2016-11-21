class StaticPagesController < ApplicationController
 
  def home
  	if logged_in?
      	@entry  = current_user.entries.build
     	end
     	@entries =Entry.paginate(:per_page => 5,page: params[:page])
  end

  def help
  end
end
