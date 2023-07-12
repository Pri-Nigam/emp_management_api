class AddDefaultToTypeInLeaves < ActiveRecord::Migration[7.0]
  def change
    change_column :leaves, :type, :integer, default: 0
  end
end
