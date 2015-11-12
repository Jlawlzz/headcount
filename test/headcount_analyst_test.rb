require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/headcount_analyst'
require './lib/district'

class HeadcountAnalystTest < Minitest::Test
  def test_district_averages
    district1 = District.new({:name => "Colorado", :participation => {2007 => 0.395}})
    district1.enrollment = Enrollment.new({:name => "Colorado", :participation => {2007 => 0.400, 2008 => 0.600}})
    district2 = District.new({:name => "ACADEMY 20", :participation => {2007 => 0.200, 2008 => 0.300}})
    district2.enrollment = Enrollment.new({:name => "ACADEMY 20", :participation => {2007 => 0.200, 2008 => 0.300}})
    ha = HeadcountAnalyst.new
    assert_equal 0.5, ha.district1_average(district1, district2)
    assert_equal 0.25, ha.district2_average(district1, district2)
  end 
end

#   def test_district_average_over_multiple_years
#     skip
#     er = EnrollmentRepository.new("ACADEMY 20", :against => "COLORADO")
#     assert_equal 1, er.district_average.
#   end 

#   def test_district_average_single_year
#   skip
#   end
# end 