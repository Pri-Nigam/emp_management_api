class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.references :designation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
