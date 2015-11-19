class User < ActiveRecord::Base

  has_many :groups, through: :users_groups
end
