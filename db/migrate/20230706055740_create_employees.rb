class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.date :date_of_birth
      t.string :contact

      t.timestamps
    end
  end
end
