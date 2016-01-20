class UsersController < ApplicationController
  
	def show
    # @user = User.paginate(page: params[:page])
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    # @user_id =  User.find(params[:user_id]) 
  end

  def index
  	@users = User.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end  

  def like

    post = Micropost.where(id: params[:id]).first
    if post.present?
      is_liked = VoterRelationship.where(user_id: current_user, micropost_id: post.id, islike: true).first
      if(is_liked)
        is_liked.destroy
      else
        VoterRelationship.create(user_id: current_user.id, micropost_id: post.id, islike: true )
      end
    end
    redirect_to :back    
  end	
end
