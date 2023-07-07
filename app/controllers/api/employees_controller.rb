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
    if employee.save
      render json: employee, status: :created
    else
      render json: employee.errors.messages
    end
  end

  def update
    @employee.update(employee_params)
    if @employee.save
      render json: @employee
    else
      render json: @employee.errors.messages
    end
  end

  def destroy
    @employee.destroy
  end

  def department_employees
    department = Department.find_by(name: params[:name])
    designation = department.designations.find_by(title: params["\"title\n\""])
    employee = designation.employees.all

    render json: employee
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :password, :date_of_birth, :gender, :contact, :designation_id)
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

end
