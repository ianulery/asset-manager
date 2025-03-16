class License < ActiveRecord::Base
  belongs_to :device
  validates :item, :key, presence: true
end
