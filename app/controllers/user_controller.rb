class UserController < ApplicationController
  
	def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])

    @user_id =  User.find(params[:user_id]) 
  end

  def index
  	 @users = User.paginate(page: params[:page])
  end
  def new
    @user = User.new
  end

  def like
    logger.debug '11111111111111111111111'
    logger.debug params
    # vr = VoterRelation.new(post_id: params[:post_id], user_id: current_user.id)
    # vr = current_user.voter_relationships.new(post_id: params[:post_id])
    post = Micropost.where(id: params[:post_id]).first
    if post.present?
      vr = post.voter_relationships.new(user_id: current_user.id)
      if vr.save
        flash[:notice] = 'Liked'
        redirect_to microposts_path
      else
        flash[:error] = 'There is some issue liking the post.'
        redirect_to microposts_path
      end
    else
      flash[:error] = 'No posts available for like'
      redirect_to microposts_path
    end
  end


		
end
