class Activity < ActiveRecord::Base

  belongs_to :group
  has_many :users, through: :rsvps

  validates :name,
    presence: true
  validates :location,
    presence: true
  validates :completed,
    presence: true,
    inclusion: { in: [true, false] }
  validates :group_id,
    numericality: { only_integer: true }
end
