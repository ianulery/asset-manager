class AddLocationManagers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :locations, :people do |t|
      t.index :location_id
      t.index :person_id
    end
  end
end
