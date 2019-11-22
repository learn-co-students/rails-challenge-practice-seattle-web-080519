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

  def current_company_floors
    puts "x"
  end

  def floors_available_and_curr_company_floors
  
    puts "x"
    # floors_available << self.floor
    # floors_available
  end

  def empty_offices
    floors_available.count
  end

  def total_rent
    companies.count * self.rent_per_floor
  end

end
