# Preview all emails at http://localhost:3000/rails/mailers/person
class InventoryPreview < ActionMailer::Preview
  def person_inventory
    InventoryMailer.with(person: Person.first).person_inventory
  end

  def location_inventory
    InventoryMailer.with(location: Location.first).location_inventory
  end
end
