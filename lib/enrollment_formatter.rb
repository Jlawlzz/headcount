require 'CSV'
require 'pry'

class EnrollmentFormatter

  attr_reader :handle, :hash_bin


  def initialize(handle_path)
    @hash_bin = []
    @handle = CSV.open(handle_path, :headers => true, :header_converters => :symbols)
  end

  def single_line_format(csv_line)
    if @hash_bin.empty?
      push_to_hash_bin(csv_line)
    else
      create_new_or_append_hash(csv_line)
    end
  end

  def create_new_or_append_hash(csv_line)
    @hash_bin.each do |hash|
      if hash[:name] == csv_line[:location]
        pair_name_and_pair_for_repeat_district(hash, csv_line)
      else
        push_to_hash_bin(csv_line)
      end
    end
  end

  def push_to_hash_bin(csv_line)
    @hash_bin << pair_name_and_year_percentage(csv_line)
  end

  def pair_year_percentage(csv_line)
    sub_hash = {csv_line[:TimeFrame] => csv_line[:Data]}
  end

  def pair_name_and_pair_for_repeat_district(hash, csv_line)
    hash[:participation].merge!(pair_year_percentage(csv_line))
    hash
  end

  def pair_name_and_year_percentage(csv_line)
    hash = {name: csv_line[:location], participation: pair_year_percentage(csv_line)}
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
