class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.attachment :sheet

      t.timestamps
    end
  end
end
