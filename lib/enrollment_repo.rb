require_relative 'enrollment'

class EnrollmentRepository

  attr_reader :enrollment_bin

  def initialize
    @enrollment_bin = []
  end

  def import_data(data)
    # binding.pry
    data.each do |district_enrollment|
      enroll_obj = Enrollment.new(district_enrollment)
      # imbed_in_district_instance(enroll_obj)
      @enrollment_bin << Enrollment.new(district_enrollment)
    end
  end

  def find_by_name(name)
    @enrollment_bin.find do |enrollment|
      name.upcase == enrollment.name
    end
  end

  # def imbed_in_district_instance(enroll_obj)
  #     dist_obj = FindByName.new.find_by_name(enroll_obj)
  #     binding.pry
  #     dist_obj.enrollment = enroll_obj
  #     binding.pry
  # end
end
