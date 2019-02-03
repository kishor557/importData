class Participant < ApplicationRecord


  validates :email, presence: true, uniqueness: true

  def self.import_data(sheet)
    header = sheet.row(1)
    (2..sheet.last_row).map do |i|
      row = Hash[[header, sheet.row(i)].transpose]
      Rails.logger.debug "\n\n..#{row.inspect}...\n"
      self.create(name: row["Name"], email: row["Email"])
    end
  end
end
