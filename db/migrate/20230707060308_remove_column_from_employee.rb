class RemoveColumnFromEmployee < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :designation, :string
  end
end
