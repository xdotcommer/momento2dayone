#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/date_format"
require File.dirname(__FILE__) + "/day"
require File.dirname(__FILE__) + "/entry"
require File.dirname(__FILE__) + "/input"

include Input

@days = []

@current_entry = nil
@current_day   = nil

ARGF.each_line do |line|
  line = process_line(line)

  if line =~ /^(#{ Day::DAYS }) (\d+) (#{ Day::MONTHS }) (#{ Day::YEARS })\r\n$/
    @current_entry = Entry.new(nil, nil, [])
    @current_day   = Day.new(Date.parse("#{$3} #{$2}, #{$4}"), [ @current_entry ])
    @days << @current_day

    # skip the next two lines...
    3.times { line = read_and_process_line(line) }
    @current_entry.process_time_line line

  elsif line =~ /^#{ TIME_SEPARATOR }$/ 

    # skip the next line...
    2.times { line = read_and_process_line(line) }
    @current_entry = Entry.new(nil, nil, [])
    @current_day.entries << @current_entry
    @current_entry.process_time_line line

  # Day One doesn't have tags :(
  #
  # elsif line =~ /^Tags: (.*)\r\n$/
  # 
  #   @current_entry.tags = $1
  # 
  elsif @current_entry
    @current_entry.lines << line
  end
end

@days.each do |day|
  day.entries.each do |entry|
    system "echo \"#{entry.lines.join}\" | dayone -d=\"#{day.date.to_s} #{entry.time}\" new"
  end
end

# puts @days.inspect