class User < ActiveRecord::Base
  has_many :users_groups
  has_many :groups, through: :users_groups
  has_many :activities, through: :rsvps

  validates :name,
    presence: true
  validates :city,
    presence: true
  validates :picture,
    format: { with: /.*(.png|.jpe?g|.gif|.JPG)/ }
  validates :description,
    presence: true

  after_initialize :init

  def init
    self.badge_count ||= 0
  end

end
