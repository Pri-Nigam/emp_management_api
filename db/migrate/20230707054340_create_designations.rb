class CreateDesignations < ActiveRecord::Migration[7.0]
  def change
    create_table :designations do |t|
      t.string :title
      t.text :description
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
