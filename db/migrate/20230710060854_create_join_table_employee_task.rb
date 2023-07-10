class CreateJoinTableEmployeeTask < ActiveRecord::Migration[7.0]
  def change
    create_join_table :employees, :tasks do |t|
      # t.index [:employee_id, :task_id]
      # t.index [:task_id, :employee_id]
    end
  end
end
