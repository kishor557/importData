require 'roo'

class Event < ApplicationRecord


  validates :title, presence: true, uniqueness: true

  def self.import_data(sheet)
    header = sheet.row(1)
    (2..sheet.last_row).map do |i|
      row = Hash[[header, sheet.row(i)].transpose]
      Rails.logger.debug "\n\n..#{row.inspect}...\n"
      self.create(title: row["Title"], location: row["Location"], date: row["Date"])
    end
  end

end

#    sheets = xlsx.sheets
#    sheets.each do |sheet_name|
#      full_sheet = xlsx.sheet_for(sheet_name)
#      header = full_sheet.row(1)
#      (2..full_sheet.last_row).map do |i|
#        row = Hash[[header, full_sheet.row(i)].transpose]
#        Rails.logger.debug "\n\n..#{row.inspect}...\n"
#      end
#    end
