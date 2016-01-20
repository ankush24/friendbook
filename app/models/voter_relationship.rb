class VoterRelationship < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :user

  # def is_like?(postid)
  # 	like = VoterRelationship.where(post_id: postid, user_id: current_user.id)
  # 	if like.nil?
  # 		false
  # 	else
  # 		true
  # 	end
  # end
end
