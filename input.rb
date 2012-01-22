module Input
  TIME_SEPARATOR = "---\r\n"
  
  def read_and_process_line(line)
    line = ARGF.readline
    Input.process_line(line)
  end
  
  def process_line(line)
    rv = ""
    Encoding::Converter.new('utf-8', 'ascii').primitive_convert(line, rv)
    rv.gsub(/"/, "'")
  end
end

