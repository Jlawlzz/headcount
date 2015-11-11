
require 'CSV'
require 'pry'

class EnrollmentFormatter

 def pair_year_percentage(row)
  sub_hash = {row[:timeframe] => row[:data]}
 end

 def pair_name_and_pair_for_repeat_district(hash, row)
   hash[:participation].merge!(pair_year_percentage(row))
 end

 def pair_name_and_year_percentage(row)
   {name: row[:location], participation: pair_year_percentage(row)}
 end
end


#taking in unformatted CSV data
#breaking into lines
# iterating through a single line
  # combine year and the percentage into a hash
  # couple with district name
#have (District => name) & kingergarden participation (year => percentage)
# iterate through again
  #if key exists, add(push) value to sub_hash of key
  #if key doesn't exist, create new key and value pair
#have hash of keys: name, participation(may have multiple values)
