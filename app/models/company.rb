class Company < ApplicationRecord
  has_many :employees
  has_many :offices
  has_many :buildings, through: :offices

  accepts_nested_attributes_for :employees
  accepts_nested_attributes_for :offices


  # On this page, a user should be able to see a list of all of its offices, as well as the building in which the office is located
# On this page, a user should be able to see how much total rent it is paying 
# On this page, a user should be able to add an employee to the company
# On this page, a user should be able to see a list of all employees
# On this page, a user should be able to remove an employee from the company


  def office_info
    result = self.offices.map do |office|
      "Floor # #{office.floor} in #{office.building.name} costs #{office.building.rent_per_floor}."
    end
    result 
  end

  def building_info
    self.buildings.pluck("name")
  end

  def total_rent
    self.buildings.pluck("rent_per_floor").sum
  end


end
