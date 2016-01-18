module UserHelper
	# Returns the Gravatar for the given user.
  def gravatar_for(current_user)
  	# if (current_signed_in?)
  			gravatar_id = Digest::MD5::hexdigest(current_user.email.downcase)
    		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    		image_tag(gravatar_url, alt: current_user.email, class: "gravatar")
  	# end    
  end
end
