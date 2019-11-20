class Office < ApplicationRecord
  belongs_to :building
  belongs_to :company
  validates :floor, numericality: { only_integer: true }

  def num_employees
    self.company.employees.count
  end

  def list_employees
    self.company.employees.pluck("name", "title").map do |emp|
      "Name: #{emp[0]}, Title: #{emp[1]}"
    end
  end

end
