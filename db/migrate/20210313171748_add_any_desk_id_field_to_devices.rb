class AddAnyDeskIdFieldToDevices < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :anydesk_id, :string
  end
end
