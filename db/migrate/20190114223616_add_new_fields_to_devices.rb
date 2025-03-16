class AddNewFieldsToDevices < ActiveRecord::Migration[5.2]
  def up
    add_column :devices, :asset_number, :string
    add_column :devices, :item, :string
    Device.find_each { |d| d.update(item: "#{d.brand} #{d.name}")}
    remove_column :devices, :name, :string
    remove_column :devices, :brand, :string
  end

  def down
    add_column :devices, :name, :string
    add_column :devices, :brand, :string
	Device.find_each { |d| d.update(name: d.item)}
    remove_column :devices, :asset_number, :string
    remove_column :devices, :item, :string
  end
end
