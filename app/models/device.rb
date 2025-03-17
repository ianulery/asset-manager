class Device < ActiveRecord::Base
  belongs_to :location
  belongs_to :person
  has_many :licenses, dependent: :nullify
  validates :item, :person, :location, presence: true

  def searchable_name
    "#{asset_number} - #{item} - #{person.name} - #{location.name}"
  end

  def age
    return nil unless acquired_at.present?
    "#{((Time.now - acquired_at.to_time) / 1.year.seconds).floor} years"
  end
end
