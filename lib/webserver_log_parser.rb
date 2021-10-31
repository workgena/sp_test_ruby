# frozen_string_literal: true

class WebserverLogParser
  attr_accessor :file

  def initialize(file)
    # file.each_line do |row|
    #   puts row
    # end
    @file = file
  end

  def stats
    0
  end
end
