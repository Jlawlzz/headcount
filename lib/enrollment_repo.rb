require_relative 'enrollment'
require_relative 'district_repo'

class EnrollmentRepository

  attr_reader :enrollment_bin

  def initialize
    @enrollment_bin = []
  end

  def import_data(data)
    data.each do |district_enrollment|
      enroll_obj = Enrollment.new(district_enrollment)
      imbed_in_district_instance(enroll_obj)
      @enrollment_bin << Enrollment.new(district_enrollment)
    end
  end 

  def imbed_in_district_instance(enroll_obj)
      dist_obj = find_by_name(enroll_obj.name)
      dist_obj.enrollment = enroll_obj
  end
end 

 