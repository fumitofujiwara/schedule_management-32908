class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.text :text,           null: false
      t.references :user,     foreign_key: true
      t.references :schedule, foreign_key: true
      t.timestamps
    end
  end
end
