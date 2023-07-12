class CreateLeaves < ActiveRecord::Migration[7.0]
  def change
    create_table :leaves do |t|
      t.date :from_date
      t.date :to_date
      t.integer :from_session
      t.integer :to_session
      t.string :reason
      t.string :mail_to
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
