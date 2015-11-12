require './lib/district_repo'

class FindByName

  def find_by_name(name)
      @district_bin.find do |district|
      name.upcase == district.name
    end
  end
end
