class AddIsDiscardedToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :is_discarded, :boolean, default: false
  end
end
