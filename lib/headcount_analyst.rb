require_relative 'district_repo'
require_relative 'enrollment_repo'
require 'pry'


class HeadcountAnalyst

  def district1_average(district1, district2)
    district1_avg = district1.enrollment.participation_years.values.inject(:+) / district1.enrollment.participation_years.count
  end 

  def district2_average(district1, district2)
    district2_avg = district2.enrollment.participation_years.values.inject(:+) / district2.enrollment.participation_years.count
  end 

  def kindergarten_participation_rate_variation(district1, district2)
    comparison = district1_average(district1, district2) / district2_average(district1, district2)
    comparison.round(3)
  end

  
end 

 
#need seperate methods for 1 and 3 based on return
#break up average logic into different methods
#how does district compare to state average?
#how does district compare to other district average?
#return individual years

# => {2010=>0.392}
# sub_hash[2010] => 0.392
