class Salary < ApplicationRecord
  belongs_to :designation  

  def monthly_income
    basic = self.basic_salary
    allowance = basic/10 # assuming 10% of total baisc_salary
    deduction = basic/20 # assuming 5% of total basic_salary 
    net_income = basic-allowance-deduction
  end

  def annual_income
    basic = self.basic_salary
    annual = basic*12
    allowance = annual/10 # assuming 10% of total annual_salary
    deduction = annual/20 # assuming 5% of total annual_salary 
    gross_income = annual-allowance-deduction
  end
end
