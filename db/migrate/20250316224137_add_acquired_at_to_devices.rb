class AddAcquiredAtToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :acquired_at, :date
  end
end
