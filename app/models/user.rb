class User < ActiveRecord::Base

  has_many :usergroups
  has_many :groups, through: :usergroups
  has_many :rsvps
  has_many :activities, through: :rsvps

  validates :name,
    presence: true
  validates :city,
    presence: true
  validates :picture,

    format: { with: /.*(.png|.jpe?g|.gif|.JPE?G|.GIF|.PNG)/ }

  validates :description,
    presence: true

  after_initialize :init

  def init
    self.badge_count ||= 0
  end

end
