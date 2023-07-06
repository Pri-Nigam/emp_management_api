class AddColumnToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :name, :string
    add_column :employees, :date_of_birth, :date
    add_column :employees, :gender, :string
    add_column :employees, :contact, :string
    add_column :employees, :designation, :string
  end
end
