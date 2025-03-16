class AddParametersToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :brand, :string
    add_column :devices, :picture, :boolean
    add_column :devices, :condition, :string
    add_column :devices, :need_to_replace, :boolean
    add_column :devices, :quantity, :integer
  end
end
