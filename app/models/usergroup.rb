class Usergroup < ActiveRecord::Base

  belongs_to :user
  belongs_to :group

  validates :user_id,
    presence: true,
    numericality: { only_integer: true }
  validates :group_id,
    presence: true,
    numericality: { only_integer: true }


end
