require './lib/enrollment_formatter'

class PreFormat

   attr_reader :handle, :hash_bin

  def initialize(handle_path)
    @hash_bin = []
    @handle = CSV.read(handle_path, :headers => true, header_converters: :symbol)
    @formatter = EnrollmentFormatter.new
  end

  def iterate_through_csv
    @handle.each do |row|
      single_line_format(row)
    end
  end

  def single_line_format(row)
    if @hash_bin.empty?
      # binding.pry
      @hash_bin << @formatter.pair_name_and_year_percentage(row)
    else
      unique_district?(row)
    end
   end

   def unique_district?(row)
     temp = nil
     @hash_bin.each do |hash|
       if hash[:name] == row[:location]
         temp = hash
       end
     end
     route_format(row, temp)
   end

   def route_format(row, temp)
     if temp == nil
      #  binding.pry
       @hash_bin << @formatter.pair_name_and_year_percentage(row)
      #  binding.pry
     else
      #  binding.pry
       @formatter.pair_name_and_pair_for_repeat_district(row, temp)
      #  binding.pry
     end
   end
 end
