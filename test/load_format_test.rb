require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/load_format'


class LoadFormatTest < Minitest::Test

  def load_data
    @ld = {
          :enrollment => {
              :kindergarten => "./data/Kindergartners in full-day program.csv",
              :high_school_graduation => "./data/High school graduation rates.csv"
              }
          }
  end

  def test_pull_apart_data_sub_category_data
    lf = LoadFormat.new(load_data)
    lf.pull_apart_category
    output = lf.formatted_load
    assert output[:kindergarten].count > 5
    assert output[:high_school_graduation].count > 5
  end
end

