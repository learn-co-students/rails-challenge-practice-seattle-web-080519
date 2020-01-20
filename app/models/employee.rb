class Employee < ApplicationRecord
  belongs_to :company

  validates :name, presence: true, length: { minimum: 5 }
  validates :title, presence: true
end
