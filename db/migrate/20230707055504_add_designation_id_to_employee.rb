class AddDesignationIdToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :designation, null: false, foreign_key: true
    remove_column :employees, :department_id
  end
end
