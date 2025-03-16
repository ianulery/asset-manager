class CreateLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :licenses do |t|
      t.string :item
      t.string :key
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
