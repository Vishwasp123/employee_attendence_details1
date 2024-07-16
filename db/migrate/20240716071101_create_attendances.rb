class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :date
      t.datetime :check_in_time
      t.datetime :check_out_time
      t.string :status
      t.timestamps
    end
  end
end
