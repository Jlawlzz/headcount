
require 'CSV'
require 'pry'

class EnrollmentFormatter

 def pair_year_percentage(row)
  sub_hash = {row[:timeframe] => row[:data].to_f.round(3)}
 end

 def pair_name_and_pair_for_repeat_district(row, hash)
   hash[:participation].merge!(pair_year_percentage(row))
 end

 def pair_name_and_year_percentage(row)
   hash = {name: row[:location], participation: pair_year_percentage(row)}
 end
end
