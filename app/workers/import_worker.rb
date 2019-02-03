class ImportWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  require 'roo'
  
  def perform(file_path)
    xlsx = Roo::Spreadsheet.open(file_path)

    xlsx.each_with_pagename do |name, sheet|
      Rails.logger.debug "\n\n..#{name}..#{sheet.inspect}...\n"
      case name.downcase
        when "events"
          Event.import_data(sheet)
        when "participants"
          Participant.import_data(sheet)
      end
    end
  end
  
end
