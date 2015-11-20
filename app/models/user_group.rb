class UserGroup < ActiveRecord::Base
  # def table_name
  #   'users_groups'
  # end

  belongs_to :user
  belongs_to :group

  validates :user_id,
    presence: true,
    numericality: { only_integer: true }
  validates :group_id,
    presence: true,
    numericality: { only_integer: true }


end
