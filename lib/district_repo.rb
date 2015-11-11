require_relative 'district'
require_relative 'pre_format'

class DistrictRepository

  attr_reader :district_bin

  def initialize
    @district_bin = []
  end

 def load_data(path)
   data = File.open(path[:enrollment][:kindergarten]) 
   pre = PreFormat.new(data)
   pre.iterate_through_csv
   to_object(pre.hash_bin)
 end

  def to_object(load_data)
    load_data.each do |district|
      @district_bin << District.new(district)
    end
  end

  def find_by_name(name)
    @district_bin.find do |district|
      name.upcase == district.name
    end
  end

  def find_all_matching(word_fragment)
    find_all = @district_bin.select do |district|
      district if district.name.include?(word_fragment.upcase)
    end
    find_all
  end

end
