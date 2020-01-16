class Employee < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates :title, presence: true
end
