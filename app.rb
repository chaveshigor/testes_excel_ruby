# frozen_string_literal: true

require 'benchmark'
require 'benchmark/memory'

require './read_file/read_csv'
require './read_file/read_xlsx'
require './read_file/read_xls'

def header_xlsx_roo
  ReadFile::ReadXlsx.new(file_path: 'test_files/personagens.xlsx').read_header
end

def header_xlsx_simple_xlsx_reader
  ReadFile::ReadXlsx.new(file_path: 'test_files/personagens.xlsx').read_header_simple_xlsx_reader
end

puts "Benchmark para ler o cabeçalho"

# Benchmark para ler o cabeçalho
Benchmark.bm do |x|
  x.report('roo') { header_xlsx_roo }
  #x.report('simple_xlsx_reader') { header_xlsx_simple_xlsx_reader }
  #x.compare!
end

##################################################################################################

def read_xlsx_roo
  ReadFile::ReadXlsx.new(file_path: 'test_files/personagens.xlsx').read_xlsx
end

def read_xlsx_roo_stream
  ReadFile::ReadXlsx.new(file_path: 'test_files/personagens.xlsx').read_xlsx_stream
end

def read_xlsx_simple_xlsx_reader
  ReadFile::ReadXlsx.new(file_path: 'test_files/personagens.xlsx').read_xlsx_simple_xlsx_reader
end

def read_xlsx_roo_to_csv
  ReadFile::ReadXlsx.new(file_path: 'test_files/personagens.xlsx').to_csv
end

puts "\n\nBenchmark para ler o arquivo xlsx"

# Benchmark para ler o arquivo
Benchmark.memory do |x|
  x.report('roo') { read_xlsx_roo }
  x.report('roo stream') { read_xlsx_roo_stream }
  #x.report('simple_xlsx_reader') { read_xlsx_simple_xlsx_reader }
  #x.report('to csv') { read_xlsx_roo_to_csv }
  #x.compare!
end

##################################################################################################

def read_xls_roo
  ReadFile::ReadXls.new(file_path: 'test_files/personagens.xlsx').read_xls
end

puts "\n\nBenchmark para ler o arquivo xls"

# Benchmark para ler o arquivo
Benchmark.bm do |x|
  x.report('roo') { read_xls_roo }
  #x.report('simple_xlsx_reader') { read_xlsx_simple_xlsx_reader }
end
