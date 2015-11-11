
require 'CSV'
require 'pry'

class EnrollmentFormatter

 attr_reader :handle, :hash_bin

 def initialize(handle_path)
   @hash_bin = []
   @handle = CSV.read(handle_path, :headers => true, header_converters: :symbol)
 end

 def iterate_through_csv
   @handle.each do |row|
     single_line_format(row)
   end
 end

 def single_line_format(row)
   if @hash_bin.empty?
     push_to_hash_bin(row)
   else
     unique_district?(row)
   end
  end

  def unique_district?(row)
    temp_hash = nil
    @hash_bin.each do |hash|
      if hash[:name] == row[:location]
        temp_hash = hash
      end
    end
    route_format(row, temp_hash)
  end

  def route_format(row, temp_hash)
    if temp_hash == nil
      @hash_bin << pair_name_and_year_percentage(row)
    else
      pair_name_and_pair_for_repeat_district(temp_hash, row)
    end
  end

  def push_to_hash_bin(row)
   @hash_bin << pair_name_and_year_percentage(row)
  end

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
