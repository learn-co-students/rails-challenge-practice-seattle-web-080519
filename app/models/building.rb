class Building < ApplicationRecord

  has_many :offices
  has_many :companies, through: :offices
  validates_presence_of :name, :country, :address, :rent_per_floor, :number_of_floors

  def all_floors
    all_floors = Array(1...self.number_of_floors)
  end

  def floors_available
    available_floors_array = all_floors
    self.offices.each do |office|
      available_floors_array.delete(office.floor)
    end
    available_floors_array
  end

# floors available returns only the vacant floors. I want floors available to also return a floor that a company has rented too. So a user can uncheck it.

  def current_company_floors
    byebug
    self.
  end

  def floors_available_and_curr_company_floors
    byebug
    available_floors_array = all_floors
    self.offices.each do |office|
      available_floors_array.delete(office.floor)
    end
    available_floors_array
    # total_available = floors_available + current_company_floors
  end

  def empty_offices
    floors_available.count
  end

  def total_rent
    companies.count * self.rent_per_floor
  end

end
