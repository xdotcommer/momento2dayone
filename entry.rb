Entry = Struct.new(:time, :tags, :lines)

class Entry
  def process_time_line(line)
    if line =~ /^(\d{1,2}\:\d\d) (AM|PM) (.*)\r\n$/
      self.time = "#{$1}#{$2}"
      lines << $3
    end
  end
end