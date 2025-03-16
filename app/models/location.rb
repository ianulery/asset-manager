class Location < ActiveRecord::Base
  has_many :devices
  has_and_belongs_to_many :people, join_table: :locations_people
  validates :name, presence: true

  def send_inventory_email
    return unless people.present?
    
    InventoryMailer.with(location: self).location_inventory.deliver_now
  end
end
