class CreateRsvpAndAddBadges < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :user_id
      t.integer :activity_id
      t.timestamps
    end
  end
end
