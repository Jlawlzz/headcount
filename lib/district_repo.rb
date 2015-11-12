require_relative 'district'
require_relative 'pre_format'
require_relative 'enrollment_repo'
require_relative 'load_format'
require 'pry'

class DistrictRepository

  attr_reader :district_bin, :enroll_repo

  def initialize
    @district_bin = []
  end

  def load_data(path_set)
    lf = LoadFormat.new(path_set)
    lf.pull_apart_category
    data_for_repo = lf.formatted_load

    import_data(data_for_repo[:kindergarten])

    @enroll_repo = EnrollmentRepository.new
    @enroll_repo.import_data(data_for_repo)

    create_data_enroll_link
  end

  def create_data_enroll_link
    @district_bin.each do |district|
      temp = @enroll_repo.find_by_name(district.name)
      district.enrollment = temp
    end
  end

  def import_data(data)
    data.each do |district|
      @district_bin << District.new(district)
    end
  end

  def find_by_name(name)
      @district_bin.find do |district|
        name.upcase == district.name
    end
  end

  def find_all_matching(word_fragment)
    find_all = @district_bin.select do |district|
      district if district.name.include?(word_fragment.upcase)
    end
    find_all
  end
end
