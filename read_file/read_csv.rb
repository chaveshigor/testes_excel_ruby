# frozen_string_literal: true

require 'csv'

module ReadFile
  class ReadCsv
    def initialize(file_path:)
      @file_path = file_path
    end

    def read_csv
      puts 'lendo csv'
      CSV.foreach(file_path, headers: true, col_sep: ',', encoding: Encoding::UTF_8, quote_char: "\"") do |row|
        p "#{row[1]} #{row[2]}"
      end
    end

    def read_header
      CSV.open(file_path, headers: true).read.headers
    end

    attr_reader :file_path
  end
end
