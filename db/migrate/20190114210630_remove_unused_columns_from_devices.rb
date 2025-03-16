class RemoveUnusedColumnsFromDevices < ActiveRecord::Migration[5.2]
  def change
    remove_column :devices, :picture, :boolean
    remove_column :devices, :condition, :string
    remove_column :devices, :need_to_replace, :boolean
    remove_column :devices, :quantity, :integer
  end
end
