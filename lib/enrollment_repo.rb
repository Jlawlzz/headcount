require_relative 'enrollment'

class EnrollmentRepository

  attr_reader :enrollment_bin

  def initialize
    @enrollment_bin = []
  end

  def to_object(collected_enrollments)
    collected_enrollments.each do |district_enrollment|
      @enrollment_bin << Enrollment.new(district_enrollment)
    end
  end

  def find_by_name(name)
    @enrollment_bin.find do |district_enrollment|
      name.upcase == district_enrollment.name
    end
  end
end 