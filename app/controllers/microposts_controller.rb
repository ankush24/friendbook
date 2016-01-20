class MicropostsController < ApplicationController
	before_action :correct_user,   only: :destroy

	def index
		@microposts = Micropost.all
	end

	def create
    @micropost = current_user.microposts.build(micropost_params)
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

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
