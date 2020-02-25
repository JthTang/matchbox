class CreateWorkHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :work_histories do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
