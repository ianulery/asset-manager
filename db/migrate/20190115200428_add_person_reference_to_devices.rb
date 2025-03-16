class AddPersonReferenceToDevices < ActiveRecord::Migration[5.2]
  def change
    add_reference :devices, :person, foreign_key: true
  end
end
