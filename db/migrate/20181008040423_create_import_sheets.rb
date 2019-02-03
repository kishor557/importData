class CreateImportSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :import_sheets do |t|
      t.attachment :sheet

      t.timestamps
    end
  end
end
