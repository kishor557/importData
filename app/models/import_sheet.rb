class ImportSheet < ApplicationRecord

  has_attached_file :sheet
  #do_not_validate_attachment_file_type :sheet

  validates_attachment :sheet, presence: true
  
  validates_attachment_file_name :sheet, matches: [/\.xls/, /\.xlsx?$/, /\.csv?$/], message: ' Only EXCEL files are allowed.'
 
 validate :validate_file_size
 
 
  def validate_file_size
    if sheet.present? && sheet_file_size > 10.megabytes
      errors.add(:file_size, "file size should not be greater then 10MB.")
    end
  end          
end
