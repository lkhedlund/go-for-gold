class AddInitialTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :city
      t.string :picture
      t.string :description
      t.string :badge_count
      t.timestamps
    end
    create_table :groups do |t|
      t.string :name
      t.timestamps
    end
    create_table :activities do |t|
      t.string :name
      t.string :date
      t.string :time
      t.string :location
      t.boolean :completed
      t.integer :group_id
      t.timestamps
    end
    create_table :usergroups do |t|
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
  end
end
