class FriendshipController < ApplicationController

	def friend_request
	  unless (current_user.is_pending_request?(params[:id]))	
		  from_id = current_user.id
		  to_id = params[:id] 
		  friendship = Friendship.create(from_id: from_id, to_id: to_id, accepted: false)
		  redirect_to users_show_path(to_id)
		else
			redirect_to root_path
		end  
	end
	
	def friend_request_accept
	  @friendship = Friendship.where(to_id: current_user.id, from_id: params[:id]).first
	  @friendship.update_attributes(accepted: true)
	  redirect_to root_path
	end

	def friend_request_reject
	  friendship = Friendship.where(to_id: params[:id], from_id: current_user.id).first
	  friendship1 = Friendship.where(to_id: current_user.id, from_id: params[:id]).first
	  unless frienship.nil?
	  friendship.destroy
		end
	  unless friendship1.nil?
	  	friendship1.destroy
	  end
	  redirect_to root_path
	end

	def pending_request
		@requests = Friendship.where(to_id: current_user.id, accepted: false)
		#Redirect_to pending_request_path 
	end

	def friends
	 @friends = Friendship.where(to_id: current_user.id, accepted: true)
		#edirect_to pending_request_path 
		# @friends = current_user.get_friends
	end

end
