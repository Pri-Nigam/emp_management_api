class Designation < ApplicationRecord
  belongs_to :department
  has_many :employees
  has_one :salary
end
