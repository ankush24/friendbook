class Role < ActiveRecord::Base
  # belongs_to :user #:join_table => :users_roles
  has_one :user
  # belongs_to :resource, :polymorphic => true

  # validates :resource_type,
  #           :inclusion => { :in => Rolify.resource_types },
  #           :allow_nil => true

  # scopify
end
