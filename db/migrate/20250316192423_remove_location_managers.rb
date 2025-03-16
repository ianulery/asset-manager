class RemoveLocationManagers < ActiveRecord::Migration[7.0]
  def up
    drop_table :locations_people
  end

  def down
    create_join_table :locations, :people do |t|
      t.index :location_id
      t.index :person_id
    end
  end
end
