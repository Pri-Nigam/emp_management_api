class Api::LeavesController < ApplicationController
  before_action :find_employee
  before_action :find_leave, only: [:show, :update, :destroy]

  def index
    leaves = @employee.leaves.all
    render json: leaves
  end

  def show
    render json: @leave
  end

  def create
    leave = @employee.leaves.new(leave_params)
    if leave.save
      render json: leave, status: :created
    else
      render json: leave.errors.messages
    end
  end

  def update
    if @leave.update(leave_params)
      render json: @leave, status: :ok
    else
      render json: @leave.errors.messages
    end
  end

  def destroy
    @leave.destroy
  end

  def leaves_applied
    leaves = Leave.where(mail_to: @employee.email)
    render json: { leaves: leaves }
  end  

  def accept
    @leave.accepted!
  end

  def reject
    @leave.rejected!
  end
  
  private

  def find_employee
    @employee = Employee.find(params[:employee_id])
  end

  def find_leave
    @leave = @employee.leaves.find(params[:id])
  end

  def leave_params
    params.require(:leave).permit(:from_date, :to_date, :from_session, :to_session, :mail_to, :reason, :leave_type, :status)
  end
end
