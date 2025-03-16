class Device < ActiveRecord::Base
  belongs_to :location
  belongs_to :person
  has_many :licenses, dependent: :nullify
  validates :item, :person, :location, presence: true

  def searchable_name
    "#{asset_number} - #{item} - #{person.name} - #{location.name}"
  end
end
