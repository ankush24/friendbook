class Friendship < ActiveRecord::Base
	belongs_to :user, :foreign_key => "from_id"
	# belongs_to :to_user, :foreign_key => "to_id"
end
