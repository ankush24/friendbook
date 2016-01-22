class MicropostsController < ApplicationController
	before_action :correct_user,   only: :destroy

	def index
		@microposts = Micropost.all
	end

	def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
    	@feed_items = []
      render 'welcome/index'
    end
	end

	def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  def update
     @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(micropost_params)
      redirect_to @micropost
    end
  end  

  def showpost
    @posts = Micropost.find(params[:id])
    @comment = Commenter.new
    @comments = Commenter.where(micropost_id: @posts.id)
  end

  def add_comment
    @posts = Micropost.find(params[:commenter][:micropost_id])
    @comments = Commenter.where(micropost_id: @posts.id)
     @comment = Commenter.new
     @comment.user_id = params[:commenter][:user_id]
     @comment.micropost_id = params[:commenter][:micropost_id]
     @comment.comments = params[:commenter][:comments]
     if @comment.save
      flash[:success] = "Comment Successfully Added"     
      redirect_to posts_show_path(@posts.id)
     else
      render :showpost  
    end

  end

  # def show_comment
  #   @show_comment = Commenter.where(micropost_id: params[:id]) 
  # end



  private

    # def comment_params
    #   params.require(:commenter).permit(:comments, :user_id, :micropost_id)
    # end

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
