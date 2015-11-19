class User < ActiveRecord::Base

  has_many :groups, through: :users_groups

  validates :name,
    presence: true
  validates :city,
    presence: true
  validates :picture,
    format: { with: /.*(.png|.jpe?g|.gif)/ }
  validates :description,
    presence: true

end
