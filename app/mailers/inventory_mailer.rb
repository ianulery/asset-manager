class InventoryMailer < ApplicationMailer
  def person_inventory
    @person = params[:person]
    mail(
      to: @person.email,
      subject: 'IT Equipment Inventory'
    )
  end

  def location_inventory
    @location = params[:location]
    mail(
      to: @location.people.collect(&:email),
      subject: "Location IT Equipment Inventory"
    )
  end
end
