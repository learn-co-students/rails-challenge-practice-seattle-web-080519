class Company < ApplicationRecord
  has_many :employees, dependent: :destroy
  has_many :offices, dependent: :destroy
  has_many :buildings, through: :offices

  accepts_nested_attributes_for :employees
  accepts_nested_attributes_for :offices

  validates :name, presence: true

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

  def current_company_floors
    self.offices.map do |office|
      office.buildings
    end
  end

end
