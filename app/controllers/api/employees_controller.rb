class Api::EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    render json: { employees: @employees }
  end

  def show
    employee = Employee.find(params[:id])
    render json: employee
  end

  def create
    employee = Employee.new(employee_params)
    employee.save
  end

  def update
    employee = Employee.find(params[:id])
    employee.update(employee_params)
    employee.save
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :password, :date_of_birth, :gender, :contact, :designation)
  end

end
