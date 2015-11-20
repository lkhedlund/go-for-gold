class Activity < ActiveRecord::Base

  belongs_to :group
  has_many :rsvps
  has_many :users, through: :rsvps

  validates :name, presence: true
  validates :location, presence: true
  validates :completed, inclusion: [true, false]
  validates :group_id, numericality: { only_integer: true }

end
