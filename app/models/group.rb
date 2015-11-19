class Group < ActiveRecord::Base

  has_many :users, through: :users_groups
  has_many :activities

  validates :name,
    presence: true
end
