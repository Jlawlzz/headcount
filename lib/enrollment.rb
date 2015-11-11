require 'pry'

class Enrollment

  attr_reader :name, :participation_years

  def initialize(enrollment_data)
    @name = enrollment_data[:name]
    @participation_years = enrollment_data[:participation]
  end

  def kindergarten_participation_by_year
    participation_years
  end 

  def kindergarten_participation_in_year(year)
    participation_years[year]
  end
end