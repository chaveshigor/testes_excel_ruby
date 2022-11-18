# frozen_string_literal: true

require 'roo'

module ReadFile
  class ReadXls
    def initialize(file_path:)
      @file_path = file_path
    end

    def read_header
      xlsx = Roo::Spreadsheet.open(file_path)
      xlsx.each_row_streaming do |row|
        "#{row[0].cell_value}, #{row[1].cell_value}"
        break
      end
    end

    def read_xls
      xlsx = Roo::Spreadsheet.open(file_path)
      xlsx.each_row_streaming do |row|
        "#{row[0].cell_value}, #{row[1].cell_value}"
      end
    end

    attr_reader :file_path
  end
end
