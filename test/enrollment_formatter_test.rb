require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enrollment_formatter'

class EnrollmentFormatterTest < Minitest::Test

  def test_handle_equals_correct_file_path
    ef = EnrollmentFormatter.new("./data/kindergartners dummy .csv")
    assert_equal CSV, ef.handle.class
  end

  def test_creates_sub_hash_year_percent_for_single_line
    ef = EnrollmentFormatter.new("./data/kindergartners dummy .csv")
    hash = {2007 => 0.39465}
    assert_equal hash, ef.pair_year_percentage({:location => "Colorado", :TimeFrame => 2007, :DataFormat => "Percent", :Data => 0.39465})
  end

  def test_pairs_name_and_pair_for_single_line
    ef = EnrollmentFormatter.new("./data/kindergartners dummy .csv")
      hash = {:name => "district", :participation => {2010 => 0.3915}}
      csv_line = {:location => "district", :TimeFrame => 2010, :DataFormat => "Percent", :Data => 0.3915}
      assert_equal hash, ef.pair_name_and_year_percentage(csv_line)
  end

  def test_pairs_name_and_pair_for_repeat_district_name
    ef = EnrollmentFormatter.new("./data/kindergartners dummy .csv")
    hash = {:name => "district", :participation => {2009 => 0.1}}
    csv_line = {:location => "district", :TimeFrame => 2010, :DataFormat => "Percent", :Data => 0.3915}
    hash_mod = {:name => "district", :participation => {2009 => 0.1, 2010 => 0.3915}}
    assert_equal hash_mod, ef.pair_name_and_pair_for_repeat_district(hash, csv_line)
  end

  def test_single_line_format_for_unique_district_name
    ef = EnrollmentFormatter.new("./data/kindergartners dummy .csv")
    hash = {:name => "Colorado", :participation => {2007 => 0.39465}}
    ef.single_line_format({:location => "Colorado", :TimeFrame => 2007, :DataFormat => "Percent", :Data => 0.39465})
    assert_equal hash, ef.hash_bin[0]
  end

  def test_single_line_format_for_duplicate_district_name
    ef = EnrollmentFormatter.new("./data/kindergartners dummy .csv")
    ef.hash_bin << {:name => "Colorado", :participation => {2009 => 0.1}}
    hash_mod = [{:name => "Colorado", :participation => {2009 => 0.1, 2010 => 0.3915}}]
    assert_equal hash_mod, ef.single_line_format({:location => "Colorado", :TimeFrame => 2010, :DataFormat => "Percent", :Data => 0.3915})
  end
end
