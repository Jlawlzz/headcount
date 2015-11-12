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

  #take in district one particiaption_years
  #take in district two particiaption_years
  #iterate through, comparing district one values against district two values for each year
  #link result back to year
  #print all year and 

  def distryearly_comparisions
  end

  def kindergarten_participation_rate_variation_trend(district1, district2)

  end 

end 

