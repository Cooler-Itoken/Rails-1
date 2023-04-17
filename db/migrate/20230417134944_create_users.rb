class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :title
      t.date :startDate
      t.date :endDate
      t.string :allDay
      t.string :memo

      t.timestamps
    end
  end
end
