class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.date :date
      t.attachment :sheet

      t.timestamps
    end
  end
end
