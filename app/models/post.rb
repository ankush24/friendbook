class Post < ActiveRecord::Base
resourcify
belongs_to :user class_name: 'User' 
end
