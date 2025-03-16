class Person < ActiveRecord::Base
  has_many :devices, dependent: :nullify
  has_and_belongs_to_many :locations, join_table: :locations_people
  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def send_inventory_email
    InventoryMailer.with(person: self).person_inventory.deliver_now
  end

  def name
    "#{first_name} #{last_name}"
  end
end
