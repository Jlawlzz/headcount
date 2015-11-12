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
    ha = HeadcountAnalyst.new()
    assert_equal 0.5, ha.district1_average(district1, district2)
    assert_equal 0.25, ha.district2_average(district1, district2)
  end 

  def test_kindergarden_participation_rate
    district1 = District.new({:name => "Colorado", :participation => {2007 => 0.395}})
    district1.enrollment = Enrollment.new({:name => "Colorado", :participation => {2007 => 0.400, 2008 => 0.600}})
    district2 = District.new({:name => "ACADEMY 20", :participation => {2007 => 0.200, 2008 => 0.300}})
    district2.enrollment = Enrollment.new({:name => "ACADEMY 20", :participation => {2007 => 0.200, 2008 => 0.300}})
    ha = HeadcountAnalyst.new
    assert_equal 2, ha.kindergarten_participation_rate_variation(district1, district2)
  end 

  def test_kindergarden_participation_rate
    district1 = District.new({:name => "Colorado", :participation => {2007 => 0.395}})
    district1.enrollment = Enrollment.new({:name => "Colorado", :participation => {2007 => 0.400, 2008 => 0.600, 2010 => 0.500}})
    district2 = District.new({:name => "ACADEMY 20", :participation => {2007 => 1.00, 2008 => 1.00}})
    district2.enrollment = Enrollment.new({:name => "ACADEMY 20", :participation => {2007 => 1.00, 2008 => 1.00, 2011 => 0.800}})
    ha = HeadcountAnalyst.new
    assert_equal 0.536, ha.kindergarten_participation_rate_variation(district1, district2)
  end 

  def test_kindergarten_participation_rate_variation_trend
    district1 = District.new({:name => "Colorado", :participation => {2007 => 0.395}})
    district1.enrollment = Enrollment.new({:name => "Colorado", :participation => {2007 => 0.400, 2008 => 0.600, 2010 => 0.500}})
    district2 = District.new({:name => "ACADEMY 20", :participation => {2007 => 1.00, 2008 => 1.00}})
    district2.enrollment = Enrollment.new({:name => "ACADEMY 20", :participation => {2007 => 1.00, 2008 => 1.00, 2011 => 0.800}})
    ha = HeadcountAnalyst.new
    expected_hash = {2007=>2.5, 2008=>1.667}
    assert_equal expected_hash, ha.kindergarten_participation_rate_variation_trend(district1, district2)
  end
end

