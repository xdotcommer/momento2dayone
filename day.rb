Day   = Struct.new(:date, :entries)

class Day
  DAYS   = Date::DAYNAMES.join("|")
  MONTHS = Date::MONTHNAMES.join("|")
  YEARS  = (2008..2020).to_a.join("|")
end
