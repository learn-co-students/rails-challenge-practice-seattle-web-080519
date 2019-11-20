class Building < ApplicationRecord

  has_many :offices
  has_many :companies, through: :offices
  validates_presence_of :name, :country, :address, :rent_per_floor, :number_of_floors

  def floors_available
    all_floors = Array(1..self.number_of_floors)
    available_floors_array = all_floors
    self.offices.each do |office|
      available_floors_array.delete(office.floor)
    end
    available_floors_array
  end

  def empty_offices
    floors_available.count
  end

  def total_rent
    floors_available.count * self.rent_per_floor
  end

  # def empty_offices
  #   number_of_floors_available.map { |f| offices.build(floor: f) }
  # end

end
