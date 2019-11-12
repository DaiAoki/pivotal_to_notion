#!/usr/bin/ruby

# require 'pry-byebug'
require 'csv'

puts "start..."

if ARGV[0].nil?
  puts "Please input CSV filename on arguments."
  exit
end

if !File.exist?(ARGV[0])
  puts "#{ARGV[0]} is not found."
  exit
end

header = "Name,Assign,Status\n"

File.open("extract_#{ARGV[0]}", 'w') do |file|
  file.write(header)
  rows = CSV.read(ARGV[0], headers: true)
  rows.each do |row|
    type = row["Type"]
    name = if type == "feature"
             "#{row['Type']}(#{row['Estimate']}pt) | #{row['Title']}"
           else
             "#{row['Type']} | #{row['Title']}"
           end
    assign = row["Owned By"]
    status = row["Current State"]
    extracted_row = [ name, assign, status ].join(",") + "\n"
    file.write(extracted_row)
  end
end

puts "complete!"
