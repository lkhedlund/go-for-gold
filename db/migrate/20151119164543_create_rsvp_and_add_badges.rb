class CreateRsvpAndAddBadges < ActiveRecord::Migration
  def change
    add_column :users, :badge_count, :string

    create_table :rsvps do |t|
      t.integer :user_id
      t.integer :activity_id
    end
  end
end
