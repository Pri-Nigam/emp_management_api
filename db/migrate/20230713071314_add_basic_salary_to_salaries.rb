class AddBasicSalaryToSalaries < ActiveRecord::Migration[7.0]
  def change
    add_column :salaries, :basic_salary, :decimal
  end
end
