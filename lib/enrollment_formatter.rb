
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
     binding.pry
     single_line_format(row)
   end
 end

 def single_line_format(row)
   if @hash_bin.empty?
     push_to_hash_bin(row)
   else
     create_new_or_append_hash(row)
   end
  end

  def create_new_or_append_hash(row)
    temp = nil
    @hash_bin.each do |hash|
      if hash[:name] == row[:location]
        temp = hash
      end
    end
    if temp == nil
      binding.pry
      @hash_bin << pair_name_and_year_percentage(row)
      binding.pry
    else
      binding.pry
      pair_name_and_pair_for_repeat_district(temp, row)
      binding.pry
    end
  end

  def push_to_hash_bin(row)
   @hash_bin << pair_name_and_year_percentage(row)
  end

  def pair_year_percentage(row)
   sub_hash = {row[:timeframe] => row[:data]}
  end

  def pair_name_and_pair_for_repeat_district(hash, row)
   binding.pry
   hash[:participation].merge!(pair_year_percentage(row))
   binding.pry
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
