require_relative 'district_repo'
require_relative 'enrollment_repo'
require 'pry'


class HeadcountAnalyst

  def initialize(district_repo)
    @district_repo = district_repo
  end

  def pull_district_objects(district)
    @district_repo.enroll_repo.find_by_name(district)
  end

  def district1_average(district1, district2)
    district1 = pull_district_objects(district1)
    district1_avg = district1.participation_years.values.inject(:+) / district1.participation_years.count
  end 

  def district2_average(district1, district2)
    district2 = pull_district_objects(district2)
    district2_avg = district2.participation_years.values.inject(:+) / district2.participation_years.count
  end 

  def kindergarten_participation_rate_variation(district1, district2)
    comparison = district1_average(district1, district2) / district2_average(district1, district2)
    comparison.round(3)
  end

  def kindergarten_participation_rate_variation_trend(district1, district2)
    district1 = pull_district_objects(district1)
    district2 = pull_district_objects(district2)
    yearly_comparison = {}    
    district1.participation_years.each do |year, value|
      if district2.participation_years.include?(year)
        division = district2.participation_years[year] / district1.participation_years[year]
        yearly_comparison[year] = division.round(3)
      end 
    end 
    yearly_comparison
  end 
end 

# if __FILE__ == $0
#   dr = DistrictRepository.new
#   dr.import_data([{:name => "Colorado", :participation => {2007 => 0.395}}, {:name => "ACADEMY 20", :participation => {2007 => 0.200, 2008 => 0.300}}])
#   ha = HeadcountAnalyst.new(dr)
# end


