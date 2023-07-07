class Department < ApplicationRecord
  has_many :designations
  has_many :employees, through: :designations
end
