require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/pre_format'

class PreFormatTest < Minitest::Test


  def test_handle_equals_correct_file_path
    ef = PreFormat.new("./data/kindergartners dummy .csv")
    assert_equal CSV::Table, ef.handle.class
  end


  def test_single_line_format_for_unique_district_name
    ef = PreFormat.new("./data/kindergartners dummy .csv")
    hash = {:name => "Colorado", :participation => {2007 => 0.395}}
    ef.single_line_format({:location => "Colorado", :timeframe => 2007, :dataformat => "Percent", :data => 0.39465})
    assert_equal hash, ef.hash_bin[0]
  end

  def test_single_line_format_for_duplicate_district_name
    ef = PreFormat.new("./data/kindergartners dummy .csv")
    ef.hash_bin << {:name => "Colorado", :participation => {2009 => 0.1}}
    hash_mod = {2009=>0.1, 2010=>0.392}
    assert_equal hash_mod, ef.single_line_format({:location => "Colorado", :timeframe => 2010, :dataformat => "Percent", :data => 0.3915})
  end
end
