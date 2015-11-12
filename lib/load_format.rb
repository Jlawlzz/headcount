require_relative 'pre_format'
require 'pry'

class LoadFormat

  attr_reader :formatted_load

  def initialize(load_data)
    @load_data = load_data
    @formatted_load = {}
  end

  def pull_apart_category
    @load_data.each do |category, data|
      pull_apart_data(data)
      @formatted_load.merge!@sub_hash
    end
  end

  def pull_apart_data(data)
    @sub_hash = {}
    data.each do |sub_category, sub_data|
      pre = PreFormat.new(sub_data)
      pre.iterate_through_csv
      @sub_hash.merge!({sub_category => pre.hash_bin})
    end
  end
end


