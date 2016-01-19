class WelcomeController < ApplicationController
  
  def index

  	@users = User.all
  	@micropost = Micropost.new
  	if (user_signed_in?)
  	 @micropost = current_user.microposts.build if user_signed_in?
  	 @feed_items = current_user.microposts.paginate(page: params[:page])
  	end
  end
  
end
