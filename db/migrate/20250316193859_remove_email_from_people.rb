class RemoveEmailFromPeople < ActiveRecord::Migration[7.0]
  def change
    remove_column(:people, :email, type: :string)
  end
end
