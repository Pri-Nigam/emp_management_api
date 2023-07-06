class Api::EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :update, :destroy]

  def index
    @employees = Employee.all
    render json: { employees: @employees }
  end

  def show
    render json: @employee
  end

  def create
    employee = Employee.new(employee_params)
    employee.save
  end

  def update
    @employee.update(employee_params)
    @employee.save
  end

  def destroy
    @employee.destroy
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :password, :date_of_birth, :gender, :contact, :designation)
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

end
