class Api::AttendancesController < ApplicationController
  before_action :find_employee
  
  def index
    attendances = @employee.attendances
    render json: attendances
  end

  def show
    date = Date.parse(params[:date])
    attendance = @employee.attendances.where(check_in: date.beginning_of_day..date.end_of_day)
    total_hours = attendance.map(&:total_hours)[0]
    render json: { attendance: attendance, total_hours: total_hours }
  end

  def create
    attendance = @employee.attendances.build(attendance_params)
    if attendance.save
      render json: attendance, status: :created
    else
      render json: attendance.errors.messages
    end
  end

  def update
    @attendance = @employee.attendances.find(params[:id])
    if @attendance.update(attendance_params)
      render json: @attendance
    else
      render json: @attendance.errors.messages
    end
  end

  private

  def find_employee
    @employee = Employee.find(params[:employee_id])
  end

  def attendance_params
    params.require(:attendance).permit(:check_in, :check_out)
  end
end
