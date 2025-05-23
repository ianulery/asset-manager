class Person < ActiveRecord::Base
  has_many :devices, dependent: :nullify
  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
