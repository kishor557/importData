require 'roo'

class ImportSheetsController < ApplicationController

  def index
    @sheets = ImportSheet.all
  end

  def new
    @import_sheet = ImportSheet.new
  end
  
  def create
    @import_sheet = ImportSheet.new(import_params)
    if @import_sheet.save
    
      if @import_sheet.sheet.present?
        path = @import_sheet.sheet.url
        fullpath = root_url + path
        ImportWorker.perform_async(fullpath)        
      end
      
      redirect_to import_sheets_path, notice: "Uploaded Successfully!"
    else
      Rails.logger.debug "\n\n..#{@import_sheet.errors.inspect}...\n"
      render action: "new"
    end
  end
  
  def process_sheet
    @sheet = ImportSheet.find(params[:id])
    path = @sheet.sheet.url
    fullpath = root_url + path
    ImportWorker.perform_async(fullpath)

    redirect_to import_sheets_path, notice: "Processed Successfully!"
  end
  
  private
  
  def import_params
    params.require(:import_sheet).permit(:sheet)
  end

end
