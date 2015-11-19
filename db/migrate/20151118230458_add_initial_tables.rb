class AddInitialTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :city
      t.string :picture
      t.string :description
      t.timestamps
    end
    create_table :groups do |t|
      t.string :name
      t.timestamps
    end
    create_table :activities do |t|
      t.string :name
      t.datetime :time
      t.string :location
      t.boolean :completed
      t.integer :group_id
      t.timestamps
    end
    create_table :users_groups do |t|
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
  end
end
