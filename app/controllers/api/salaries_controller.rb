class Api::SalariesController < ApplicationController
  before_action :find_salary

  def index
    render json: { basic_salary: @salary }
  end

  def monthly_salary
    @leave_days = @employee.accepted_leaves
    net_salary = (@employee.salary.monthly_income - leave_deduction)
    render json: { net_salary: net_salary }
  end

  def annual_salary
    gross_salary = @employee.salary.annual_income
    render json: { gross_salary: gross_salary }
  end

  private

  def find_salary
    @employee = Employee.find(params[:employee_id])
    @salary = @employee.salary.basic_salary
  end

  def leave_deduction
    wage = @salary/30
    wage * @leave_days
  end
end
