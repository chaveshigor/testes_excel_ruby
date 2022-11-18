# frozen_string_literal: true

require 'roo'
require 'simple_xlsx_reader'

module ReadFile
  class ReadXlsx
    def initialize(file_path:)
      @file_path = file_path
    end

    def read_header
      xlsx = Roo::Spreadsheet.open(file_path)
      xlsx.sheet(0).row(1)
    end

    def read_header_simple_xlsx_reader
      rows = SimpleXlsxReader.open(file_path).sheets.first.rows
      rows.each do |row|
        return row
      end
    end

    def read_xlsx
      xlsx = Roo::Spreadsheet.open(file_path)
      number_of_rows = xlsx.sheet(0).last_row
      (1..number_of_rows).each do |row_numer|
        xlsx.sheet(0).row(row_numer).join(', ')
      end
    end

    def read_xlsx_stream
      rows = Roo::Excelx.new(file_path)
      rows.each do |row|
        #"#{row[0]}, #{row[1]}"
        row.join(', ')
      end
    end

    def read_xlsx_simple_xlsx_reader
      rows = SimpleXlsxReader.open(file_path).sheets.first.rows
      rows.each do |row|
        row.join(', ')
      end
    end

    def to_csv
      xlsx = Roo::Spreadsheet.open(file_path)
      xlsx.sheet(0).to_csv
    end

    attr_reader :file_path
  end
end
