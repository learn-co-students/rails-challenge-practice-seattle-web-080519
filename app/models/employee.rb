class Employee < ApplicationRecord
  belongs_to :company

  validates_presence_of :name, :title
end
