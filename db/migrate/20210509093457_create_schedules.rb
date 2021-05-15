class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime :start_date,  null: false
      t.datetime :ending_date, null: false
      t.string :content,       null: false
      t.text :detail,          null: false
      t.references :user,      foreign_key: true
      t.timestamps
    end
  end
end
