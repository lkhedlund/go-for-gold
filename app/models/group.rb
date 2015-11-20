class Group < ActiveRecord::Base


  has_many :usergroups
  has_many :users, through: :usergroups

  has_many :activities

  validates :name,
    presence: true

end
