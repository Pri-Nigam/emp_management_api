class Api::TasksController < ApplicationController
  before_action :find_employee
  before_action :find_task, only: [:update, :destroy, :show]

  def index
    tasks =  @employee.tasks.all
    render json: { tasks: tasks }
  end

  def show
    render json: @task
  end

  def create
    byebug
    task = @employee.tasks.create(task_params)
    if task
      render json: task, status: :created
    else
      render json: task.errors.messages
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors.messages
    end
  end

  def destroy
    @task.destroy
  end

  private

  def find_employee
    @employee = Employee.find(params[:employee_id])
  end

  def find_task
    @task = @employee.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :duedate)
  end
end
