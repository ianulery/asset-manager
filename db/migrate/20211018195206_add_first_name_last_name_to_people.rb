class AddFirstNameLastNameToPeople < ActiveRecord::Migration[6.1]
  class Person < ActiveRecord::Base
  end

  def up
    add_column :people, :first_name, :string
    add_column :people, :last_name, :string
    Person.reset_column_information
    Person.all.each do |person|
      names = person.name.split
      person.update(first_name: names.try(:[], 0), last_name: names.try(:[], 1))
    end
    remove_column :people, :name
  end

  def down
    add_column :people, :name, :string
    Person.reset_column_information
    Person.all.each do |person|
      person.update(name: "#{person.first_name} #{person.last_name}")
    end
    remove_column :people, :first_name, :string
    remove_column :people, :last_name, :string
  end
end
