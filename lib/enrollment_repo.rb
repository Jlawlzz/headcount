require_relative 'enrollment'

class EnrollmentRepository

  attr_reader :enrollments

  def initialize
    @enrollments = []
  end

  def import_data(data)
    # {:enrollment => {:kindergarten => [...], :hsg => [...]}}
    data[:kindergarten].each do |row_data|
      @enrollments << Enrollment.new(row_data)
    end
  end

  def find_by_name(name)
   @enrollments.find do |enrollment|
     name.upcase == enrollment.name
   end
 end

end

  # def imbed_in_district_instance(enroll_obj)
  #     dist_obj = FindByName.new.find_by_name(enroll_obj)
  #     binding.pry
  #     dist_obj.enrollment = enroll_obj
  #     binding.pry
  # end
