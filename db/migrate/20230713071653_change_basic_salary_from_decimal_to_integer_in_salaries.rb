class ChangeBasicSalaryFromDecimalToIntegerInSalaries < ActiveRecord::Migration[7.0]
  def change
    change_column :salaries, :basic_salary, :integer
  end
end
