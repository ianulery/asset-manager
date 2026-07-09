class RemoveAnydeskIdFromDevices < ActiveRecord::Migration[8.1]
  def change
    remove_column :devices, :anydesk_id, :string
  end
end
