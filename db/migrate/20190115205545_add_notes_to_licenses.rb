class AddNotesToLicenses < ActiveRecord::Migration[5.2]
  def change
    add_column :licenses, :notes, :text
  end
end
