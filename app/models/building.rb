class Building < ApplicationRecord

  has_many :offices
  has_many :companies, through: :offices

  validates :name, presence: true
  validates :country, presence: true
  validates :address, presence: true
  validates :rent_per_floor, presence: true
  validates :number_of_floors, presence: true

  # create an array of all floors
  def all_floors
    all_floors = Array(1...self.number_of_floors)
  end

  # floors available removes the offices that are already rented.
  def floors_available
    available_floors_array = all_floors
    self.offices.each do |office|
      available_floors_array.delete(office.floor)
    end
    available_floors_array
  end

# current_company_floors takes in the company's id. It queries if the company has an office in the building. Then creates an array with those floors.
  def current_company_floors(company_id)
    current_company_floors_ar = []
    company_offices_in_this_building = self.offices.where(company_id: company_id)
    company_offices_in_this_building.each do |office|
      current_company_floors_ar << office.floor
    end
    current_company_floors_ar
  end

  # floors_available_and_curr_company_floors combines the results of the previous two methods and returns it. 
  def floors_available_and_curr_company_floors(company_id)
    total_available = floors_available + current_company_floors(company_id)
    total_available.sort!
    total_available
  end

  def empty_offices
    floors_available.count
  end

  def total_rent
    companies.count * self.rent_per_floor
  end

end
