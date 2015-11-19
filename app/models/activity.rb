class Activity < ActiveRecord::Base

  belongs_to :group

  validates :name,
    presence: true
  validates :time,
    presence: true
  validates :location,
    presence: true
  validates :completed,
    presence: true,
    inclusion: { in: [true, false] }
  validates :group_id,
    numericality: { only_integer: true }
end
